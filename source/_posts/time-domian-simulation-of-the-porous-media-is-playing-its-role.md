---
title: Time-domian simulation of the sound propagation in porous medium is playing its role
date: 2018-11-21 19:47:57
tags: [porous media, time domain simulation]
katex: true
---

The porous medium is widely used as the sound-absorbing materials in the file of noise and vibration control due to their low weight, low price and effectiveness. This fact drives the development of acoustic performance prediction for a porous media. To accurately predict the acoustic performance of acoustic equipment or the noise in the open sound field, acoustic numerical simulation technology has emerged and developed rapidly, especially after the great step forwarding of the High Performance Computing & Simulation (HPCS).

Since the air density is always far little than the frame density of the porous medium in acoustic control, the frame of the porous medium can be seen as motionless. Such medium was called rigid skeleton porous medium. Special attention has been paid to the propagation of the monochromatic sound wave in the rigid skeleton porous medium. That is because the response of a porous media in the time domain can be described by an instantaneous response and a "susceptibility" kernel responsible for the memory effects. Various empirical and semi-phenomenological models were developed for the describing of the wave propagation in the porous medium. Tab. 1 lists 14 impedance models and the parameters on which they depend.

Tab.1 Impedance models and parameters (adapted from Ref.2). 


| Model                        | No. of parameters |                          Parameters                          |
| ---------------------------- | :---------------: | :----------------------------------------------------------: |
| Delany and Bazley (-Miki)    |         1         |                 Effecctive flow resistivity                  |
| Taraldsen                    |         1         |                 Effecctive flow resistivity                  |
| Variable porous              |         2         | Effecctive flow resistivity, rate of porous variation with depth |
| Voronina                     |         3         | Mean grain dimension, number of grains per unit volume.grain density |
| Zwikker and Kosten           |         3         |         Porosity, flow resistivity, structure factor         |
| Hamet phenomenological       |         3         |         Porosity, flow resistivity, structure factor         |
| Identical tortuous porous    |         3         |            Porosity, flow resistivity, tortuosity            |
| Attenborough                 |         4         |  Porosity, flow resistivity, tortuosity, pore shape factor   |
| Wilson relaxation            |         4         |  Porosity, tortuosity, Viscous and thermal relaxation times  |
| Pore size distribution       |         4         | Porosity, flow resistivity, tortuosity, distribution parameter |
| Johnson/Allard/Umnova        |         4         | Porosity, flow resistivity, tortuosity, viscous characteristic lengh |
| Johnson/Allard               |         5         | Porosity, flow resistivity, tortuosity, viscous, thermal characteristic lengths |
| Johnson/Allard/Lafarge       |         6         | Porosity, flow resistivity, tortuosity, viscous and thermal characteristic lengths, thermal permeability |
| Johnson/Allard/Lafarge/Pride |         8         | Porosity, flow resistivity, tortuosity, viscous and thermal characteristic lengths, thermal permeability, viscous and thermal tortuosity correction factor |

Researchers found that the asymptotic expressions of stiffness and damping in porous medium are proportional to fractional powers of frequency which suggests the fact that time derivatives of fractional order might describe the behavior of the sound waves in this kind of material. Therefore, the time domain expression of sound propagation in porous medium often contains convolution expressions, which makes it difficult for the numerical simulation of the acoustic propagation of porous medium. For example, the Wilson relaxation model can be expressed as:

$$
\frac{\bm{v}}{\tau{}_{vor}}+\frac{\partial{}\bm{v}}{\partial{}t}+A(t)=-V_{\infty{}}\nabla{}p
$$

$$
\beta{}_{\infty}\frac{\partial{}p}{\partial{}t}+B(t)= -\nabla{}\cdot{}\bm{v}
$$

$$
A(t)=\frac{1}{\sqrt{\pi{}\tau{}_{vor}}}\int_{-\infty}^t\frac{\frac{\bm{v}(t')}{\tau{}_{vor}}+\frac{\partial{}\bm{v}(t')}{\partial{}t}}{\sqrt{t-t'}}exp\left(-\frac{t-t'}{\tau{}_{vor}}\right)dt'
$$

$$
B(t)=\frac{\beta{}_\infty{}(\gamma{}-1)}{\sqrt{\pi{}\tau{}_{ent}}}\int_{ -\infty}^t\frac{\frac{\partial{}p(t')}{\partial{t'}}}{\sqrt{t-t'}}exp\left(-\frac{t-t'}{\tau{}_{ent}}\right)dt'
$$

Here, $\beta{}_\infty{}=\phi{}/P_0\gamma{}$, $V_{\infty{}}=\phi{}/\varGamma{}\alpha{}_\infty{}$, $\tau{}_{vor}=2\varGamma{}\alpha{}_\infty{}/ \sigma{}\phi{}$, $\tau{}_{ent}=N_{Pr}s_{B}^{2}\tau{}_{vor}$, $\phi{}$ is the porosity, $\alpha_\infty{}$ is the tortuosity, $\varGamma{}$ is the ambient air density. $P$ is the ambient air pressure, $\gamma{}$ is the ratio of specific heats, $N_{Pr}$ is the Prandtl number and $s_B$ is the pore shape factor. For more details about those parameters one can refer to Ref.3.

The description of sound propagation in the porous medium is often "frequency domain" in commercial software. Though the "frequency domain" argument here is not rigorous. These commercial software solutions are time domain governing equations, but these equations describing for monochromatic sounds, and the coefficients in it are frequency dependent. i.e. Zwikker and Kosten model:

$$
-\nabla{}p=\tilde{\rho}_{eq}\frac{\partial{}\bm{v}}{\partial{}t}
$$

$$
-\nabla\cdot\bm{v}=\frac{1}{\tilde{K}_{eq}}\frac{\partial{}p}{\partial{}t}
$$

Here, $\tilde{\rho}_{eq}$ is the equivalent density, $\tilde{K}_{eq}$ is the equivalent bulk modulus, they are complex functions of the frequency and of the pore shape. 

As a matter of fact, it is not only the Wilson relaxation model that describes the acoustic propagation of the porous medium in the time-domain. Zwikker & Kosten(1949) has given a time-domain phenomenological model describing the sound propagating in the porous medium:

$$
\sigma\bm{v}+\frac{k_s\rho{}_0}{\phi}\frac{\partial\bm{v}}{\partial{}t}=-\nabla{}p
$$

$$
\frac{\phi{}k_s}{\rho{}_0c_0^2}\frac{\partial{}p}{\partial{}t}=-\nabla\cdot\bm{v}
$$

Here, $k_s$ is the porous structure factor.

Wilson _et al._(2007) has pointed out that the ZK phenomenological model captured much of the important physics of sound propagation in porous medium. Theoretically, therefore, ZK phenomenological model is sufficient to meet the kind of simulation like acoustic engineering design calculations.

* * *

# Reference

[1] Fellah, Z. E. A., and C. Depollier. "Transient acoustic wave propagation in rigid porous media: A time-domain approach." The Journal of the Acoustical Society of America 107.2 (2000): 683-688.

[2] Attenborough, Keith, Imran Bashir, and Shahram Taherzadeh. "Outdoor ground impedance models." The Journal of the Acoustical Society of America 129.5 (2011): 2806-2819.

[3] Wilson, D. Keith. "Simple, relaxational models for the acoustical properties of porous media." Applied Acoustics 50.3 (1997): 171-188.

[4] Wilson, D. Keith, et al. "Time-domain calculations of sound interactions with outdoor ground surfaces." Applied Acoustics 68.2 (2007): 173-200.

[5] Van Renterghem, Timothy, Dick Botteldooren, and Kris Verheyen. "Road traffic noise shielding by vegetation belts of limited depth." Journal of Sound and Vibration 331.10 (2012): 2404-2425.