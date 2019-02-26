---
title: A Time-domain Finite Volume Method approach for the Simulation of Sound Propagation in Porous Half-Space Medium
date: 2019-02-21 21:42:59
tags: [porous media,finite volume method,numerical simulation]
---

A time-domain finite volume method solver was developed for the simulation of wave propagation in porous media, in which the variables is vertex-centered arrangement and the solver is based on Zwikker and Kosten(Z-K) Model. The boundary condition between porous media and non-viscous fluid was discussed. This approach is validated by serial numerical results.

# Introduction

Sound propagation in porous medium is an enduring topics in the file of the acoustic control due to it's cheap and efficiency. They are used in a variety of locations - close to source of noise, in various paths, and sometimes close to receivers.<sup>1</sup> Unlike frequency-domain acoustic simulation which was widely used today, time-domain simulation can provides much more information that help one understand the propagation process of a sound pulse. During the last two decades, the time-domain simulation of the porous media has been a reborn interest with the development of applications like medical imaging or sound crystals require the study of the sound propagation in the porous medium.<sup>2-9</sup> 

Serial time-domain numerical techniques have been developed to study sound propagation in porous medium, Most of them use finite-difference time-domain (FDTD) algorithms.<sup>10-13</sup> But there is one shortcoming that cannot be ignored that FDTD need additional process - such as immersed-boundary (IB) method - to adapt to the simulation of objects with complicated geometry.The finite volume method is widely used in fluid dynamics due to it's strictly  conservative and can be formulated on unstructured meshes.<sup>14</sup> Xuan et al. has developed an acoustic propagation simulator by time-domain finite volume method.<sup>15</sup> In this paper, we extend the algorithm to calculate acoustic propagation in porous medium using the Z-K model.

The paper is organised as follows: Section 2 presents the equations and limitations of  Z-K model in time-domain. The detail schemes of the discretization of equations are described in Section 3. Example calculations and comparison are provided in Section 4. A triangle porous barrier and two sonic crystals are used to test the numerical methods.

# Model equations

The linearized Euler equations are employed for sound propagation in the air medium, while the Zwikker-Kosten (Z-K) equation is applied to account for sound propagation inside the porous medium.The program solve those zones separately each time step.

Outside the porous medium:

$$
\begin{array}{lcl}
\rho{}_0\frac{\partial{}\bm{v}}{\partial{}t}=-\nabla{}p \\
c_0^2\frac{\partial{}p}{\partial{}t}=-\rho{}_0\nabla{}\cdot{}\bm{v}
\end{array}
\tag{1}
$$

Inside the porous medium:<sup>11</sup>
$$
\begin{array}{lcl}
\sigma{}\bm{v}+\frac{k_s\rho{}_0}{\phi{}}\frac{\partial{}\bm{v}}{\partial{}t}=-\nabla{}p \\
\frac{\phi}{p_0}\frac{\partial{}p}{\partial{}t}=-\nabla{}\cdot{}\bm{v}
\end{array}
\tag{2}
$$

It is well known that the Wilson Model fits well with the empirical parameters of the porous medium acoustic characters. Figs.1-2 compare predictions from the Z-K and Wilson Models for the impedance $Z$ and the phase speed $c=\omega{}Re[\Gamma]$ when low frequency approximate values were used for the parameters of Z-K Model. The results are plotted as a function of the normalized frequency $\omega{}\tau_v$. More details on how the comparisons between the Wilson Model and Z-K Model were made can be found in Ref.11. The parameter values chosen for these comparisons are $\sigma=2000$, $\phi=0.3$, $k_s=3$, $c_0=340$, $\rho=1.226$, $N_{Pr}=1$, and $s_B=1$.

![ComparisonNormalizedImpedance](/imgs/ComparisonNormalizedImpedance_L.png)

Fig.1. Normalized impedance prediction from the Z-K Model (low frequency) and Wilson Model. The negative of the imaginary part is plotted. Calculations are shown as a function of the normalized frequency $\omega{}\tau_v​$, where $\tau_v​$ is the relaxation time for viscous diffusion in the pores.

![ComparisonNormalizedPhaseSpeed](/imgs/ComparisonNormalizedPhaseSpeed_L.png)

Fig.2. Phase speed predictions from the Z-K Model (low frequency) and Wilson Model. Plotted is the phase speed divided by the phase speed in air, $c_0​$.

The impedance of two models are nearly identical, but the phase speed of Z-K Model is too low and separate dramatically with the increase of frequency. If we apply high frequency approximate values of Z-K Model, The continuity equation in $Eqs. 2​$ will be rewritten as
$$
\frac{\phi}{p_0\gamma}\frac{\partial{}p}{\partial{}t}=-\nabla{}\cdot{}\bm{v}
\tag{3}
$$
where $\gamma​$ is the ratio of specific heats in air. The impedance and the phase speed of Z-K Model will change a lot as shown in Figs.3-4.

![ComparisonNormalizedImpedance_H](/imgs/ComparisonNormalizedImpedance_H.png)

Fig.3. Normalized impedance prediction from the Z-K Model (high frequency) and Wilson Model. The negative of the imaginary part is plotted. Calculations are shown as a function of the normalized frequency $\omega{}\tau_v​$, where $\tau_v​$ is the relaxation time for viscous diffusion in the pores.

![ComparisonNormalizedPhaseSpeed_H](/imgs/ComparisonNormalizedPhaseSpeed_H.png)

Fig.4. Phase speed predictions from the Z-K Model (high frequency) and Wilson Model. Plotted is the phase speed divided by the phase speed in air, $c_0​$.

The impedance of the Z-K Model becomes incorrect when $\omega{}\tau_v\ll1​$, but the phase speed fit better with the Wilson Model. Fig.2 and 4 shows that the phase speed becomes independent of frequency for large $\omega{}\tau_v​$, whereas it should actually increase as $\omega^{1/2}​$. 

# Numerical schemes

In this section, we consider time-domain numerical implementation of the relaxation model. For the efficiency of calculation，consider simplify the control equation further：Differentiating the continuity equation in $Eqs. 2​$ by time, grading the movement equation then one can derive that
$$
\begin{cases}
a\frac{\partial^2p}{\partial{}t^2}+b\frac{\partial{}p}{\partial{}t}=\nabla{}^2p \\
a=\frac{k_s\rho_0}{\gamma{}p_0},b=\frac{\sigma{}\phi}{p_0}
\end{cases}
\tag{4}
$$
That is a single variable control equation which means that one need not consider variable coupling and can improve the efficiency of calculate dramatically. There is a high order spatial term $\nabla^2p$ in the control equation. The program use the idea of shape function to solve it (more detail will given later). We apply Vertical-Centered Finite Volume Method (VC-FVM) to discrete $Eq. 4$ and define the sound pressure on the mesh node. We assume a linear distribution (or quadratic linear distribution) of the sound pressure within the mesh cell. The control volume of the VC-FVM is showed in Fig.5 (the black line is the mesh elements and black points is the mesh nodes, the control volume of one example node is surrounded by azure faces) and Fig.6 given the assumption of the sound pressure distribution within the 2-D mesh.

![VC-FVM](/imgs/VC-FVM.png)

Fig.5. Control volume of the vertex-centered finite volume method (a). 2-D triangle cell (b). 3-D tetrahedron cell.

![VC-FVM_VriableDistribution](/imgs/VC-FVM_VriableDistribution.png)

Fig.6. Sound pressure distribution assumed in the 2D mesh, the scale of sound pressure is expressed in height (a). pure triangle cell (b). mixed cell

On any control volume, the integral form of $Eq. 4​$ is
$$
\int_{\Omega^{cv}}{a\frac{\partial^2p}{\partial{}t^2}d\Omega}+\int_{\Omega^{cv}}{b\frac{\partial{}p}{\partial{}t}d\Omega}=\int_{\Omega^{cv}}{\nabla^2pd\Omega}
\tag{5}
$$
Use low order interpolation for the mass term，assume $\ddot{p}$ and $\dot{p}$ are uniformly distribution in each control volume as is shown in Fig.7. The discretized equation is
$$
g_k\frac{\partial^2p}{\partial{}t^2}+c_k\frac{\partial{}p}{\partial{}t}=\sum_{i=1}^{nc}{\int_{\varGamma{}_i}\left(\nabla{}p\cdot\bm{n}\right)d\varGamma}
\tag{6}
$$
In which $g_k=\sum_{i=1}^{nc}{a_iS_i}$, $c_k=\sum_{i=1}^{nc}{b_iS_i}$, and $S_i$ refers to the contribution of the area (2-D) or volume (3-D) to that node by the cell (element).

![VC-FVM_dotPressureDistribution](/imgs/VC-FVM_dotPressureDistribution.png)

Fig.7. The distribution of sound pressure change rate over time which assumed in the 2-D mesh

We use shape function to calculate the grade of the pressure in the cell，the right side of $Eq. 6$ can be rewritten as
$$
\sum_{i=1}^{nc}{\int_{\varGamma{}_i}\left(\nabla{}p\cdot\bm{n}\right)d\varGamma}=\sum_{i=1}^{nc}\sum_{j=1}^{ncn}{\left(\frac{\partial{}N_j}{\partial{}x}p_j,\frac{\partial{}N_j}{\partial{}y}p_j\right)}\cdot\int_{\varGamma_i}\bm{n}d\varGamma
\tag{7}
$$
Where, $\frac{\partial{}N_j}{\partial{}x}$ and $\frac{\partial{}N_j}{\partial{}y}$ are the shape function of the cell, the value is dependent on the cell shape.

In practice, we discrete the time term as
$$
\begin{array}{lcl}
\frac{\partial^2p}{\partial{}t^2}=\frac{p^{t+\Delta{}t}-2p^t+p^{t-\Delta{}t}}{\Delta{}t^2}\\
\frac{\partial{}p}{\partial{}t}=\frac{p^t-p^{t-\Delta{}t}}{\Delta{}t}
\end{array}
\tag{8}
$$

# Simulation results



![SoundLine](/imgs/SoundLine.jpg)



# Reference

[1] Arenas, Jorge P., and Malcolm J. Crocker. “Recent trends in porous sound-absorbing materials.” *Sound & vibration* 44.7 (2010): 12-18.

[2] Bouakaz, Ayache, Charles T. Lancée, and Nico de Jong. "Harmonic ultrasonic field of medical phased arrays: Simulations and measurements." IEEE transactions on ultrasonics, ferroelectrics, and frequency control 50.6 (2003): 730-735.

[3] Hallaj, Ibrahim M., and Robin O. Cleveland. "FDTD simulation of finite-amplitude pressure and temperature fields for biomedical ultrasound." The Journal of the Acoustical Society of America 105.5 (1999): L7-L12.

[4] Jian, X. Q., et al. "FDTD simulation of nonlinear ultrasonic pulse propagation in ESWL." 2005 IEEE Engineering in Medicine and Biology 27th Annual Conference. IEEE, 2006.

[5] Fukuhara, Keisuke, and Nagayoshi Morita. "FDTD simulation of nonlinear ultrasonic pulse propagation in ESWL using equations including Lagrangian." Electrical Engineering in Japan 169.4 (2009): 29-36.

[6] Fellah, Z. E. A., and C. Depollier. “Transient acoustic wave propagation in rigid porous media: A time-domain approach.” The Journal of the Acoustical Society of America 107.2 (2000): 683-688.

[7] Miyashita, Toyokatsu, and Chiryu Inoue. "Numerical investigations of transmission and waveguide properties of sonic crystals by finite-difference time-domain method." Japanese Journal of Applied Physics 40.5S (2001): 3488.

[8] Hu, Xinhua, C. T. Chan, and Jian Zi. "Two-dimensional sonic crystals with Helmholtz resonators." Physical Review E 71.5 (2005): 055601.

[9] Ke, Guoyi, and Zhongquan Charlie Zheng. "Sound propagation around arrays of rigid and porous cylinders in free space and near a ground boundary." Journal of Sound and Vibration 370 (2016): 43-53.

[10] Salomons, Erik M., Reinhard Blumrich, and Dietrich Heimann. "Eulerian time-domain model for sound propagation over a finite-impedance ground surface. Comparison with frequency-domain models." Acta Acustica united with Acustica 88.4 (2002): 483-492.

[11] Wilson, D. Keith, et al. "Time-domain calculations of sound interactions with outdoor ground surfaces." Applied Acoustics 68.2 (2007): 173-200.

[12] Van Renterghem, Timothy, Dick Botteldooren, and Kris Verheyen. “Road traffic noise shielding by vegetation belts of limited depth.” Journal of Sound and Vibration 331.10 (2012): 2404-2425.

[13] Ke, Guoyi, and Zhongquan Charlie Zheng. "Simulation of sound propagation over porous barriers of arbitrary shapes." The Journal of the Acoustical Society of America 137.1 (2015): 303-309.

[14] Moukalled, F., L. Mangani, and M. Darwish. "The finite volume method in computational fluid dynamics." An Advanced Introduction with OpenFOAM and Matlab (2016): 3-8.

[15] Xuan, Ling-kuan, et al. "Time domain finite volume method for three-dimensional structural–acoustic coupling analysis." Applied Acoustics 76 (2014): 138-149.



