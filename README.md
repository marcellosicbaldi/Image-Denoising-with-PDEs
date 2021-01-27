# Image-Denoising-with-PDEs
Anisotropic diffusion filtering for AWGN removal

## Models
  
  - Linear diffusion filter: 𝜕𝑡𝑢 = Δ𝑢. This fiter smoothes smoothes indiscriminately the image a time passes, blurring edges. It is equivalent to Gaussian         filtering with 𝜎 = √(2𝑡).
  
  - Total Variation (TV) filter: stops the diffusion in the regions where the integral of the absolute gradient (total variation) of the signal is high. This allows to preserve edges and meaningful features.
  
  - Perona Malik (PM) filter, original: stops the diffusion based on a diffusivity function that acts as edge detector, inhibiting edge smoothing. This was implemented as proposed in the original paper. 

The main challenge of this project is the implementation of a different numerical scheme for PM. By simply applying the product rule of the divergence, we obtain that the PM equation is now the sum of a parabolic and an hyperbolic contribution. The parabolic term models diffusion, while the hyperbolic term corresponds to advection along an underlying velocity field ∇g whose direction and strength depend on edge position.
  
  - Perona Malik filter, new: equivalent to PM original, but different numerical implementation. The parabolic term is discretized with the Method of Lines (MOL), while the advection term with an Upwind scheme.
  
## Results

![Alt text](https://github.com/marcellosicbaldi/Image-Denoising-with-PDEs/blob/main/hand.jpg)

![Alt text](https://github.com/marcellosicbaldi/Image-Denoising-with-PDEs/blob/main/lena.jpg)
