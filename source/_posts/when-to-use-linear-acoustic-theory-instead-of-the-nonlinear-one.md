---
title: When to use linear acoustic theory instead of the nonlinear one
date: 2018-10-19 09:56:39
tags: [nonlinear acoustic,Acoustic Reynolds Number]
katex: true
---

# Equations of fluid dyanamics

Acoustic waves are small propagating fluctuations in pressure, particle velocity, mass density, entropy and temperature on lager and more uniform background values of these quantities. Let $p_0,\bm{v}_0,\rho{}_0, s_0, T_0$ refer to the pressure, partical velocity, mass density, specific entropy density (i.e., entropy per unit mass), and absolute temperature of the background medium, respectively. Then, the total pressure $P$ , particle velocity $\boldsymbol{V}$ , mass density $\varGamma{}$ , specific entropy density $S$ , and absolute temperature $T$ associated with a propagating acoustic disturbance are assumed to be
$$
\begin{array}{rcl}
\left\{ P,\bm{V},\varGamma,S,T \right\} & = & \left\{ p_0,\bm{v}_0,\rho{}_0,s_0,T_0 \right\} \\
& + & \left\{ p,\bm{v},\rho,s,\theta \right\}
\end{array}
$$
Similarly, the total sound speed of the medium is given by
$$
C=c_0+c
$$

## Continuity Equation

The local form (i.e., the Eulerian specification of the flow field) of the principle of conservation of mass is expressed by the continuity equation (without mass source):
$$
\frac{D\varGamma}{Dt}=-\varGamma{}\nabla{}\cdot\boldsymbol{V}
$$
Where the [*Material Derivative*](https://en.wikipedia.org/wiki/Material_derivative "refer to Wikipedia") $\frac{D[\bullet]}{Dt}=\frac{\partial{}[\bullet]}{\partial{}t}+\bm{V}\cdot\left(\nabla{}[\bullet]\right)$

## Movement Equation

Movement Equation (or the Equation of momentum) can be derived from the _Newton's Second Law_ (without body force):
$$
\varGamma\frac{D\bm{V}}{Dt}=\nabla\mathbb{T}
$$
Here $\mathbb{T}=\sigma{}_{ij}$ denotes the [Cauchy stress tensor](https://en.wikipedia.org/wiki/Cauchy_stress_tensor "refer to Wikipedia") - a second-order symmetric tensor consisted by 6 independent scalar variables.

## Constitutive Equation

The Constitutive Equation explicitly relate the Cauchy stress tensor $\sigma{}_{ij}$, the normal stress vector components $P_i$ and the velocity vector component $U_i$. For isotropic _Newtonian fluid_, with the Volume viscosity inroduced by Stokes in 1949:
$$
\begin{cases}
\sigma{}_{ij}=-P\delta{}_{ij}+T_{ij} \\
T_{ij}=\mu{}'\theta{}\delta{}_{ij}+2\mu{}d_{ij} \\
\theta{}=d_{11}+d_{22}+d_{33} \\
d_{ij}=\frac{1}{2}\left[ \frac{\partial{}U_i}{\partial{}x_j}+\frac{\partial{}U_j}{\partial{}x_i}\right]
\end{cases}
$$
Where $\mu$ is the shear viscosity, and $\mu{}'$ is the volume viscosity of the medium. Here we considered the **viscous effect** of the medium.

## Equations of State 

1. **nonlinear effect**
$$
\left( \frac{\partial{}^2P}{\partial{}\varGamma{}^2} \right)_{S,\rho{}_0}=2c_0^2\frac{\beta{}-1}{\rho{}_0}
$$
Here $\beta$ is the nonlinear coefficient.

2. **heat conduction effect**
$$
\begin{array}{rcl}
P & = & p_0+c_0^2\rho{}+\frac{1}{2}\left(\frac{\partial{}^2P}{\partial{}\varGamma{}^2}\right)_{S,\rho{}_0}\rho{}^2 \\ 
& - & \kappa\left(\frac{1}{C_v}-\frac{1}{C_p}\right)\nabla{}\cdot{}\bm{V}
\end{array}
$$
Here $\kappa{}$ is the thermal conductivity of the medium.

3. **relaxation effect**
$$
\begin{array}{rcl}
P & = & p_0+c_{\infty}^2\rho{}+\frac{1}{2}\left(\frac{\partial{}^2P}{\partial{}\varGamma{}^2}\right)_{S,\rho{}_0,\xi{}_0}\rho{}^2\\
& - & \frac{mc_0^2}{\tau{}_r}\int_{-\infty}^t\rho{}e^{-\left(t-t'\right)/\tau{}_r}dt'
\end{array}
$$
Here, $\tau{}_r$ is the relaxation time, $c_\infty$ is the sound speed when $\omega{}\tau{}_r \to \infty$, $m$ is a dimensionless parameter which describing the dispersion and dissipation characteristics of the medium.

# Linearization of the control equations

It is well know that the *Helmholtz Equation* is derived from the nonlinear acoustic theories by serial hypothesis. The viscous effect, nonlinear effect, heatconduction effect and relaxation effect can be neglected under these assumptions.

* the medium is ideal fluid.
* acoustic waves is much smaller disturbance then background medium.
* frequency of the acoustic wave is large enough that the propagation of the sound can be regard as an adiabatic process.
* the background medium is uniformly and stationary.

## How to discribe those effects

I will discuss when should we apply linear acoustic theory instead of the nonlinear one based on 1-D control equations.

### Mach Number

*Mach Number* is a dimensionless quantity representing the ratio of flow velocity to the local speed of sound.  
$$
\bm{Ma}=\frac{U}{C}=\frac{u_0+u}{c_0+c}
$$
Where, $U$ is the component of total particle velocity $\bm{V}=U_i$

### Acoustic Reynolds Number

In fluid dynamics, the *Reynolds Number* is a dimensionless quantity representing the ratio of inertia force to viscous force.

$$
\mathcal{Re}=\frac{\Gamma{}\bm{V}\cdot{}\nabla{}\bm{V}}{\mu{}\nabla{}^2\bm{V}}\approx\frac{\varGamma{}UL}{\mu}
$$
Here, $L$ is a characteristic linear dimension. Similarly, we compare the convection term with the dissipative term of the *Burgers Equation* and got it's acoustic Reynolds Number. *Bugers Equation* (no rotation) is derived from the continuity equation, movement equation and the equation of state which considered nonlinear effect and heat conduction effect.

$$
\begin{array}{rcl}\varGamma\frac{DU}{Dt}&=&\varGamma{}\frac{\partial{}U}{\partial{}t}+\varGamma{}U\frac{\partial{}U}{\partial{}x}\\&=&-c_0^2\frac{\partial{}\varGamma{}}{\partial{}x}-c_0^2\frac{\beta{}-1}{\rho_0}\frac{\partial{}\rho{}^2}{\partial{}x}+b\frac{\partial{}^2U}{\partial{}x^2}
\end{array}
$$

Here, $b=\mu{}'+2\mu{}+\kappa{}\left(\frac{1}{C_v}-\frac{1}{C_p}\right)$ . With the monochromatic traveing wave solution, the acoustic Reynolds Number can be derived 

$$
\bm{Re}=\frac{\varGamma{}U\frac{\partial{}U}{\partial{}x}}{b\frac{\partial{}^2U}{\partial{}x^2}}\sim{}\left|\frac{\frac{U}{c_0}\omega{}\rho_0{}U}{b\omega{}^2U}\right|=\frac{U\rho_0c_0}{b\omega}
$$

When the backgound medium is stationary, the acoustic Reynolds Number can be write as
$$
\bm{Re}=\frac{u\rho_0c_0}{b\omega}
$$


## When to use

1. $\bm{Ma}<0.3​$ , that means the total particle velocity is much smaller than sound velocity, the background medium is uncompressable (i.e., the mass density is uniform) and nearly stationary.
2. $\mathcal{Re}\gg 1$ , that means the $\mu$ is neglectable small, the medium can be considered as an ideal fluid (i.e., the viscous effect can be neglect).
3. $\bm{Re}\gg 1$ , that means the nonlinear effect and  heat conduction effect can be neglect (i.e., acoustic waves is much smaller disturbance then background medium and the propagation of the sound can be regard as an adiabatic process).

If all 3 conditions are met and we can apply linear acoustic theories?

No, the discussion of the relaxiation effect is needed.

* * *

# Reference

[1] Campos, L. M. "On 36 forms of the acoustic wave equation in potential flows and inhomogeneous media." Applied Mechanics Reviews 60.4 (2007): 149-171.

[2] Qian, zu . Fei Xian Xing Sheng Xue. Bei jing: Ke xue chu ban she, 2009. Print.

[3] Solui︠a︡n, Stepan Ivanovich. Theoretical foundations of nonlinear acoustics. Consultants Bureau, 1977.
