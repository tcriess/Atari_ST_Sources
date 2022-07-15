   AB039FF AQ DC=40 FS=0001 
               XX     XXXXXXX    XXXXXX    XXXXXX    XXXXXX   XXXXXXXX  XXXXXXXX 
              XXXX    XX    XX  XX    XX  XX    XX  XX    XX  XX        XX       
             XX  XX   XX    XX  XX    XX        XX  XX    XX  XX        XX       
            XX    XX  XXXXXXX   XX    XX     XXXX   XX    XX  XXXXX     XXXXX    
            XX    XX  XX    XX  XX    XX        XX  XX    XX  XX        XX       
            XXXXXXXX  XX    XX  XX    XX        XX  XXXXXXXX  XX        XX       
            XX    XX  XX    XX  XX    XX        XX        XX  XX        XX       
            XX    XX  XX    XX  XX    XX  XX    XX  XX    XX  XX        XX       
            XX    XX  XXXXXXX    XXXXXX    XXXXXX    XXXXXX   XX        XX       

 

 

   
Received: from CANADA01(LISTSERV) on 04/30/88 04:08:52 GMT-1 (NOS/BE Mailer 2.0) 
          Mail-to: DK0RRZK0(AB039   ), Format: NETDATA , Name: PROG-A16 88-00131 
Date: 12 Mar 88 18:19:57 GMT  
Comment:  Extracted from Info-Atari16 (INFO-A16) digest number 88-131  
From: mnetor!utzoo!utgpu!water!watmath!mks!wheels@uunet.uu.net  (Gerry Wheeler)  
Subject: Phong shading demo for Atari ST (C source)  
To: info-atari16@score.stanford.edu  
 
/*  
 * The following software is modeled very closely after the program that  
 * appeared in the math coprocessor section of the March '88 Byte magazine.  
 * To compile this with Mark Williams C, use the command:  
 *  
 *     cc -f -o ball.tos ball.c -lm  
 *  
 * The -f option supplies the floating point version of printf(), and the  
 * -lm option includes the math library.  
 *  
 * A Turbo C version of this program was posted recently.  I started with  
 * that source (saved me some typing -- thanks Bill), and changed it as  
 * necessary for the ST's graphics.  
 *  
 * Here are some brief test results from the Turbo C version and from the  
 * ST:  
 *  
 * Machine        Without coprocessor        With coprocessor  
 *             mm:ss                mm:ss  
 * ---------       -------------------             ----------------- 
 * ATT 6300,  
 * V30, 8bit EGA    59:37                 3:08  
 *  
 * Epson Equity III 
 * 8 MHz        37:36                 N/A  
 *  
 * IBM PS/2 mod 80  
 * EGA emulation    16:25                 1:02  
 * VGA, but same # of pixels                 0:48  
 *  
 * Atari ST  
 * low res mode        13:54                 N/A  
 *  
 * Atari ST  
 * low res (bug fixed)    14:11                 N/A  
 *  
 *  
 * The first three of the above machines were running the 80186/80286 code  
 * generated by TC, ver 1.5.  Note that the different mapping of the bit  
 * planes of VGA permitted a more efficient driver to be written, apparently  
 * because of not needing to keep tinkering with the bit plane select  
 * register as in EGA.  
 *  
 * The Atari ST version was compiled using the Mark Williams C compiler.  
 * This is a bit of an apples and oranges comparison, because the ST has  
 * fewer pixels on the screen in low res mode than the others tested.  (The  
 * ST's screen is 320 by 200 by 4 bits.) The putpixel routine is part of  
 * MWC's line A support. Things might be quicker if a custom routine were  
 * written instead of using the line A interrupts in the ST.  
 *  
 * By the way, if anyone knows, can they tell me how to read the current  
 * contents of the ST's colour palette? If I could do that, I could restore  
 * it at the end of the program.  
 *  
 * Also by the way, there is a bug in the original listing and in the  
 * Turbo C version that went around. When finding the nearest vertex to  
 * the point being drawn, in order to decide what colour to use, the loop  
 * should read "for (i=0, p=0; i<12; ++i)". The original had "i<11". This  
 * affects the timing results, since there is now one more calculation to  
 * do for each pixel, so I have included the ST's times with and without  
 * the bug. (The bug didn't affect the original display, because the vertex  
 * being omitted was the one away from the viewer. I noticed it when I  
 * changed the code to rotate the ball to a different view.)  
 */  
 
#include <math.h>  
#include <stdio.h>  
#include <time.h>  
#include <osbind.h>  
#include <xbios.h>  
#include <linea.h>  
 
clock_t start, stop;  
float    pi;  
int    colors[] = { 3, 6, 10, 13, 6, 3, 10, 13, 6, 3, 13, 10 },  
    d[] = { 320, 200 },  
    palette[] = { 0x000, 0x003, 0x005, 0x007, 0x030, 0x050, 0x070,  
            0x000, 0x300, 0x500, 0x700, 0x330, 0x550, 0x770,  
            0x000, 0x777 },  
    i, k, x, y, x_min, x_max, y_min, y_max;  
unsigned short random;  
 
 
 
main() {  
    float  a, b, c, l0, l1, l2, ln, ln1, n0, n1, n2, p, q, r=99,  
           s, t, v[12][3];  
    int old_rez;  
 
    /*  
     * Initialise palette and resolution, and line A routines.  
     */  
 
    old_rez = Getrez();  
    /* get old palette? */  
    Setscreen((char *)-1, (char *)-1, 0);  
    Setpallete(palette);  
    linea0();  
 
    /* Start timing. */  
    start = clock();  
 
    /* Pixel aspect ratio */  
    a= 1.2;    /* (d[0] / 4) / (d[1] / 3) */  
 
    /* Screen center coordinates */  
    b=0.5*(d[0]-1);  
    c=0.5*(d[1]-1);  
 
    /* Unit length light source vector */  
    l0=-1/sqrt(3.);  
    l1=l0;  
    l2=-l0;  
 
    /* Ratio of circumference to diameter of circle */  
    pi=4*atan(1.);  
 
    /* A dozen vertices evenly spread over a unit sphere. */  
    v[0][0]=0;  
    v[0][1]=0;  
    v[0][2]=1;  
    s=sqrt(5.);  
    for (i=1; i<11; i++) {  
       p = pi * i / 5;  
       v[i][0]=2*cos(p)/s;  
       v[i][1]=2*sin(p)/s;  
       v[i][2]=(1.-i%2*2)/s;  
    }  
    v[11][0]=0;  
    v[11][1]=0;  
    v[11][2]=-1;  
 
    /* Loop to Phong shade every pixel */  
    y_max=c+r;  
    y_min=2*c-y_max;  
    for (y=y_min;y<y_max;y++) {  
    s=y-c;  
    n1=s/r;  
    ln1=l1*n1;  
    s=r*r-s*s;  
    x_max=b+a*sqrt(s);  
    x_min=2*b-x_max;  
    for (x=x_min;x<x_max;x++) {  
        t=(x-b)/a;  
        n0=t/r;  
        t=sqrt(s-t*t);  
        n2=t/r;  
        /* compute dot product & clamp to positive value */  
        ln=l0*n0+ln1+l2*n2;  
        if (ln<0)  
            ln=0;  
        /* cos(e.r)**27 */  
        t=ln*n2;  
        t+=t-l2;  
        t*=t*t;  
        t*=t*t;  
        t*=t*t;  
        /* nearest vertex to normal yields max dot prod.  get that color */  
        for (i=0,p=0;i<12;i++)  
        if (p<(q=n0*v[i][0]+n1*v[i][1]+n2*v[i][2])) {  
            p=q;  
            k=colors[i];  
        }  
        /* Aggregate ambient, diffuse & specular int. & do dither. */  
        i=k-2.5+2.5*ln+t+(random=37*random+1)/65536.;  
        /* clamp values outside range of 3 color levels to blk or wht */  
        if (i<k-2)  
            i=0;  
        else if (i>k)  
            i=15;  
        putpixel(x,y,i);  
    }  
    }  
    /* Finish timing. */  
    stop = clock();  
 
    /* restore old screen parameters */  
    Setscreen((char *)-1, (char *)-1, old_rez);  
 
    /* Print timing results. */  
    printf("Time = %3.2f seconds\n", ((double)(stop-start))/CLK_TCK);  
}  
--  
     Gerry Wheeler                           Phone: (519)884-2251  
Mortice Kern Systems Inc.               UUCP: uunet!watmath!mks!wheels  
   35 King St. North                             BIX: join mks  
Waterloo, Ontario  N2J 2W9                  CompuServe: 73260,1043    
  
-AB039FF FS=0001 