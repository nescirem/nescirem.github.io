---
title: A brief introduction for wave propagations in porous media
date: 2018-10-26 19:54:39
tags: [porous media,introduction,fractal theories] 
---


# Porous Media

Most materials containing pores in them are considered as porous media and porous media widely exist in the world. Basically, a porous medium consists of pore portion and solid matrix or skeletal portion, The porous media in nature are usually filled with liquid or gas. Strictly speaking, most of solid materials in nature are porous media. Fig.1 shows the three main types of porous media, their typical microscopic arrangements and some of the physical models used to describe their mechanisms.

![](/imgs/mainTypesOfPorousMedia.png "three main types of porous media")

Fig.1. The three main types of porous media (referenced from Ref. 2)

With the significant development of the research and applications on porous media in recent years, the concept of porous media can be seen in applying in many areas of applied science and engineering. Wave propagations in porous media have great application significances in the areas of geophysics, earthquake, civil engineering, mechanical engineering, and petroleum engineering.

# Continuum Hypothesis and Fractal Theories

Due to the fact that the real structure of porous media are very complex, it is impossible to give an exact picture about the phenomenon involving the interaction of fluid and solid surface. To overcome this difficulty, one can treat the porous media as a continuum consisting of series of particles, which is very similar to the definition of fluid density. In other words, people can find a representative volume element of porous media that the size of this volume id required to be much lager than that of a single pore, which indicates that a porous medium contains many pores, which are much less than the characteristic length of the whole flow field. The porous media can then be treated as a continuum consisting of series of such elements.

> For certain media, if the porosity is irrelevant to the spatial position, the media are called homogenous media. Otherwise, it is called inhomogeneous media.

The word "fractal" was first introduce by a mathematician, [Mandelbrot](https://en.wikipedia.org/wiki/Benoit_Mandelbrot). The parameter for quantitative description of the property of fractal is called fractal dimension. Contrary to the classical Euclid geometry, whose dimension can only be assigned as an integer because it deals with regular geometrical figures, the dimension of fractal structure is a fraction. The fractal theory is applied to potential regulations from the superficial irregularity and has been widely used among many subjects.

The main characteristics of fractal geometry are self-similar and scale invariant which means part of geometrical shape can be exactly or very close to a reduced size copy of the whole. Actually, it has been reported that the microstructure and the distribution of pore size possess the characteristics of fractal. [Sierpinski triangle](https://en.wikipedia.org/wiki/Sierpinski_triangle) and [Menger sponge](https://en.wikipedia.org/wiki/Menger_sponge), as shown in Fig. 2 and Fig. 3, are typical models usually used in mathematical representing the geometries of porous media.

![](/imgs/SierpinskiTriangle.png "Sierpinski triangle")

Fig. 2. Sierpinski triangle (referenced from Wikipedia)

![](/imgs/MengerSponge.jpg "Menger sponge")

Fig. 3. Menger sponge (referenced from Wikipedia)

Since the invention of fractal theory, it has been applied to investigate the transportation problem in porous media. The porosity and permeability of porous media may be related to the fractal index. 

# Wave Propagations in Porous Media (full space domain)

In investigating wave motions in porous media, the main concern are both the waves regarding **the media** in which the waves propagate and **energy source** by which the waves are generated. In fact, the wave motions are affected by a variety of factors such as topologic and material properties of media, characteristics of wave energy sources, medium porosity and permeability, properties of the fluids saturated in the media, as well as combinations of the waves propagation in the domain considered. The behaviors of the wave motions are therefore very complex.

For the media, the wave behavior in a fluid-saturated medium is affected not only by the separate motions of the solid and fluid but also by the relative motion between the solid and fluid. It is generally accepted that the waves attenuate while they propagate in the medium due to  the material properties and the presence of the pore fluid in the porous media. In fact, wave velocity and wave attenuation are two key aspects of wave propagation in porous media. These aspects are important in analyzing the dynamic response of the media with respect to the properties of both the media and the wave source, such as viscosity, porosity, and frequency.

For the energy source, the wave propagation described in the governing equations relies on the characteristics of the energy source by which the wave is generated. Therefore, the model describing the wave field with the displacements and relative displacements between the solid and fluid for each point in the porous media domain considered is necessary.

## Component of the body waves

- P-wave (pressure or compressional wave)
- SV wave (shear vertical wave)
- SH wave (shear horizonal wave)

## Biot theory

Biot theory describes the elastic waves propagation in a porous saturated medium. Biot ignores the microscopic level and assumes that continuum mechanics can be applied to measurable macroscopic quantities. He postulates the Lagrangian and use Hamilton principle to derive the equations that govern the wave propagation.

The main assumptions of the theory are:

1. Infinitesimal transformations occur between the reference and current states of deformation. Displacements, strains and particle velocities are small. Consequently, the Eulerian and Lagrangian formulations coincide up to the first-order. The constitutive equations, dissipation forces, and kinetic momenta are linear. (The strain energy, dissipation potential and kinetic energy are quadratic forms in the field variables.)
2. The principles of continuum mechanics can be applied to measurable macroscopic values. The macroscopic quantities used in Biot's theory are volume averages of the corresponding microscopic quantities of the constituents.
3. The wavelength is large compared with the dimensions of a macroscopic elementary volume. This volume has well defined properties, such as porosity, permeability and elastic moduli, which are representative of the medium. Scattering effects are thus neglected.
4. The conditions are isothermal.
5. The stress distribution in the fluid is hydrostatic. (It may be not completely hydrostatic, since the fluid is viscous.)
6. The liquid phase is continuous. The matrix consists of the solid phase and disconnected pores, which do not contribute to the porosity.
7. In most cases, the material of the frame is isotropic. Anisotropy is due to a preferential alignment of the pores (or cracks).

# Wave propagations in  Porous Media half space domain

In engineering applications, the discussion of wave propagations in porous media half-space is often needed. And at a free boundary of half-space, the reflection, refraction and diffraction of the incident wave must be considered. Surely, that would be a difficult subject.

Theoretically, the inhomogeneous wave incident on the boundary of the medium will generate various surface waves.

## Component of the surface waves

- Rayleigh wave

  ![](/imgs/Rayleigh_wave.gif "Rayleigh wave")

  Fig. 4. The movement of a Rayleigh wave. (referenced from [quora](https://www.quora.com/Which-seismic-wave-is-the-most-dangerous-Why))

- Love wave

  ![](/imgs/Love_wave.gif "Love wave")

  Fig. 5. The movement of a Love wave. (referenced from [quora](https://www.quora.com/Which-seismic-wave-is-the-most-dangerous-Why))

## Boundary conditions of the interface

The phenomena describing the reflection, refraction and diffraction of waves are related to the presence of inhomogeneities and interfaces. Knowledge of the corresponding boundary conditions is essential to correctly describe these phenomena. In fluid/fluid contacts in porous materials, we should expect fluid flow across the interface when a wave passes, and as we have mode conversion from P-wave to S-wave energy in single-phase media, we may expect mode conversion between the three waves propagating in a porous medium. In the developments that follow, the following different cases of the appropriate boundary conditions can be derived:

1. Porous medium/porous medium.
2. Porous medium/viscoelastic single-phase medium.
3. Porous medium/viscoacoustic medium (lossy fluid).
4. Free surface of a porous medium.

# Conclusions

Although numerous investigations have been performed on wave propagations and motions of solid matrix and liquid in the pores, however, there is still a lack of comprehensive understanding on the mechanism of the technique and the mobilization of the fluids in the porous media under the mechanism of the technique and the mobilization of the fluids in the porous media under excitations of the wave motions generated with vibration stimulations.

For further applications, a thorough and systemic study on wave propagations in fluid-saturated porous half-space media in is needed. The progress in such a study will certainly contribute to the comprehensive understanding of the mechanism of the technique and enhance its application.

# Reference

[1] Hamidzadeh, Hamid R., Liming Dai, and Reza N. Jazar. Wave propagation in solid and porous half-space media. Berlin: Springer, 2014.

[2] Arenas, Jorge P., and Malcolm J. Crocker. "Recent trends in porous sound-absorbing materials." *Sound & vibration* 44.7 (2010): 12-18.

[3] Carcione, José M. Wave Fields in Real Media: Wave Propagation in Anisotropic, Anelastic, Porous and Electromagnetic Media. Vol. 38. Elsevier, 2014.