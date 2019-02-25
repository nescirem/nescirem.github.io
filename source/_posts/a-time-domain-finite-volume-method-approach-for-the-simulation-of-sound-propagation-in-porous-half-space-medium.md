---
title: A Time-domain Finite Volume Method approach for the Simulation of Sound Propagation in Porous Half-Space Medium
date: 2019-02-21 21:42:59
tags: [porous media,finite volume method,numerical simulation]
---

A time-domain finite volume method solver was developed for the simulation of wave propagation in porous media, in which the variables is vertex-centered arrangement and the solver is based on Zwikker and Kosten(Z-K) Model. The boundary condition between porous media and non-viscous fluid was discussed. This approach is validated by serial numerical results.

# Introduction

Sound propagation in porous medium is an enduring topics in the file of the acoustic control due to it's cheap and efficiency. They are used in a variety of locations - close to source of noise, in various paths, and sometimes close to receivers.<sup>1</sup> Unlike frequency-domain acoustic simulation which was widely used today, time-domain simulation can provides much more information that help one understand the propagation process of a sound pulse. During the last two decades, the time-domain simulation of the porous media has been a reborn interest with the development of applications like medical imaging or sound crystals require the study of the sound propagation in the porous medium.<sup>2-8</sup> 

Serial time-domain numerical techniques have been developed to study sound propagation in porous medium, Most of them use finite-difference time-domain (FDTD) algorithms.<sup>9-12</sup> But there is one shortcoming that cannot be ignored that FDTD need additional process - such as immersed-boundary (IB) method - to adapt to the simulation of objects with complicated geometry.The finite volume method is widely used in fluid dynamics due to it's strictly  conservative and can be formulated on unstructured meshes.<sup>13</sup> Xuan et al. has developed an acoustic propagation simulator by time-domain finite volume method.<sup>14</sup> In this paper, we extend the algorithm to calculate acoustic propagation in porous medium using the Z-K model.

The paper is organised as follows: Section 2 presents the equations and limitations of  Z-K model in time-domain. The detail schemes of the discretization of equations are described in Section 3. Example calculations and comparison are provided in Section 4. A triangle porous barrier and two sonic crystals are used to test the numerical methods.

# Model equations

The linearized Euler equations are employed for sound propagation in the air medium, while the Zwikker-Kosten (Z-K) equation is applied to account for sound propagation inside the porous medium.The program solve those zones separately each time step.

Outside the porous medium:

$$
\rho{}_0\frac{\partial{}\bm{v}}{\partial{}t}=-\nabla{}p \\
c_0^2\frac{\partial{}p}{\partial{}t}=-\rho{}_0\nabla{}\cdot{}\bm{v}
\tag{1}
$$

Inside the porous medium:<sup>10</sup>
$$
\sigma{}\bm{v}+\frac{k_s\rho{}_0}{\phi{}}\frac{\partial{}\bm{v}}{\partial{}t}=-\nabla{}p \\
\frac{\phi}{p_0}\frac{\partial{}p}{\partial{}t}=-\nabla{}\cdot{}\bm{v}
\tag{2}
$$

It is well known that the Wilson Model fits well with the empirical parameters of the porous medium acoustic characters. Figs.1-2 compare predictions from the Z-K and Wilson Models for the impedance $Z$ and the phase speed $c=\omega{}Re[\Gamma]$ when low frequency approximate values were used for the parameters of Z-K Model. The results are plotted as a function of the normalized frequency $\omega{}\tau_v$. More details on how the comparisons between the Wilson Model and Z-K Model were made can be found in Ref.10. The parameter values chosen for these comparisons are $\sigma=2000$, $\phi=0.3$, $k_s=1.95$, $c_0=340$, $\rho=1.226$, $N_{Pr}=1, $ and $s_B=1$.

![ComparisonNormalizedImpedance](/imgs/ComparisonNormalizedImpedance_L.png)

Fig.1. Normalized impedance prediction from the Z-K Model (low frequency) and Wilson Model. The negative of the imaginary part is plotted. Calculations are shown as a function of the normalized frequency $\omega{}\tau_v​$, where $\tau_v​$ is the relaxation time for viscous diffusion in the pores.

![ComparisonNormalizedPhaseSpeed](/imgs/ComparisonNormalizedPhaseSpeed_L.png)

Fig.2. Phase speed predictions from the Z-K Model (low frequency) and Wilson Model. Plotted is the phase speed divided by the phase speed in air, $c_0​$.

The impedance of two models are nearly identical, but the phase speed of Z-K Model is too low and separate dramatically with the increase of frequency. If we apply high frequency approximate values of Z-K Model, The continuity equation in Eqs.$(2)​$ will be rewritten as
$$
\frac{\phi}{p_0\gamma}\frac{\partial{}p}{\partial{}t}=-\nabla{}\cdot{}\bm{v}
\tag{3}
$$
where $\gamma​$ is the ratio of specific heats in air. The impedance and the phase speed of Z-K Model will change a lot as shown in Figs.3-4.

![ComparisonNormalizedImpedance_H](/imgs/ComparisonNormalizedImpedance_H.png)

Fig.1. Normalized impedance prediction from the Z-K Model (low frequency) and Wilson Model. The negative of the imaginary part is plotted. Calculations are shown as a function of the normalized frequency $\omega{}\tau_v$, where $\tau_v​$ is the relaxation time for viscous diffusion in the pores.

![ComparisonNormalizedPhaseSpeed_H](/imgs/ComparisonNormalizedPhaseSpeed_H.png)

Fig.2. Phase speed predictions from the Z-K Model (low frequency) and Wilson Model. Plotted is the phase speed divided by the phase speed in air, $c_0​$.

The impedance of the Z-K Model becomes incorrect when $\omega{}\tau_v\ll1​$, but the phase speed fit better with the Wilson Model. 

# Numerical schemes



# Simulation results



# Reference

[1] Arenas, Jorge P., and Malcolm J. Crocker. “Recent trends in porous sound-absorbing materials.” *Sound & vibration* 44.7 (2010): 12-18.

[2] Bouakaz, Ayache, Charles T. Lancée, and Nico de Jong. "Harmonic ultrasonic field of medical phased arrays: Simulations and measurements." IEEE transactions on ultrasonics, ferroelectrics, and frequency control 50.6 (2003): 730-735.

[3] Hallaj, Ibrahim M., and Robin O. Cleveland. "FDTD simulation of finite-amplitude pressure and temperature fields for biomedical ultrasound." The Journal of the Acoustical Society of America 105.5 (1999): L7-L12.

[4] Jian, X. Q., et al. "FDTD simulation of nonlinear ultrasonic pulse propagation in ESWL." 2005 IEEE Engineering in Medicine and Biology 27th Annual Conference. IEEE, 2006.

[5] Fellah, Z. E. A., and C. Depollier. “Transient acoustic wave propagation in rigid porous media: A time-domain approach.” The Journal of the Acoustical Society of America 107.2 (2000): 683-688.

[6] Miyashita, Toyokatsu, and Chiryu Inoue. "Numerical investigations of transmission and waveguide properties of sonic crystals by finite-difference time-domain method." Japanese Journal of Applied Physics 40.5S (2001): 3488.

[7] Hu, Xinhua, C. T. Chan, and Jian Zi. "Two-dimensional sonic crystals with Helmholtz resonators." Physical Review E 71.5 (2005): 055601.

[8] Ke, Guoyi, and Zhongquan Charlie Zheng. "Sound propagation around arrays of rigid and porous cylinders in free space and near a ground boundary." Journal of Sound and Vibration 370 (2016): 43-53.

[9] Salomons, Erik M., Reinhard Blumrich, and Dietrich Heimann. "Eulerian time-domain model for sound propagation over a finite-impedance ground surface. Comparison with frequency-domain models." Acta Acustica united with Acustica 88.4 (2002): 483-492.

[10] Wilson, D. Keith, et al. "Time-domain calculations of sound interactions with outdoor ground surfaces." Applied Acoustics 68.2 (2007): 173-200.

[11] Van Renterghem, Timothy, Dick Botteldooren, and Kris Verheyen. “Road traffic noise shielding by vegetation belts of limited depth.” Journal of Sound and Vibration 331.10 (2012): 2404-2425.

[12] Ke, Guoyi, and Zhongquan Charlie Zheng. "Simulation of sound propagation over porous barriers of arbitrary shapes." The Journal of the Acoustical Society of America 137.1 (2015): 303-309.

[13] Moukalled, F., L. Mangani, and M. Darwish. "The finite volume method in computational fluid dynamics." An Advanced Introduction with OpenFOAM and Matlab (2016): 3-8.

[14] Xuan, Ling-kuan, et al. "Time domain finite volume method for three-dimensional structural–acoustic coupling analysis." Applied Acoustics 76 (2014): 138-149.



