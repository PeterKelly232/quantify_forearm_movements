# Upper limb movements as digital biomarkers in people with ALS.

## Purpose

In our approach, we estimate the upper limb movements by measuring the gravitational component of the tri-axial raw accelerometer data collected from a wrist.
Movements are quantified in terms of counts and durations of upper limb flexion, extension, supination, and pronation. 

New measures were compared against ALSFRS-RSE total score (Q1–12), and individual responses to specific questions related to handwriting (Q4), cutting food (Q5),
dressing and performing hygiene (Q6), and turning in bed and adjusting bed clothes (Q7). Additional analysis considered adjusting for total activity counts (TAC).

## Validation

The proposed metrics were validated clinically using data from twenty ALS patients observed for six months in free-living conditions. Analytical validation was carried out using independent data collected from ten ALS patients observed in controlled conditions.

## How to use
1. Download all files to your workstation and add them to your MATLAB search path.
2. Run forearm_movements.m with three-axial accelerometer **data** collected with sampling frequency **fs** as input.
3. Note that the code was designed for data collected with ActiGraph Insight Watch. Change the formulas to calculate pitch and roll according to the coordinate system of your wearable device. 

## Reference

Straczkiewicz, M., Karas, M., Johnson S.A., Burke, K.M., Scheier, Z., Royse, T.B., Calcagno N., Clark, A., Iyer, A., Berry, J.D., Onnela, JP. A “one-size-fits-most” walking recognition method for smartphones, smartwatches, and wearable accelerometers. eBioMedicine (2024), 101: 105036
https://doi.org/10.1016/j.ebiom.2024.105036

Open Access: https://www.thelancet.com/journals/ebiom/article/PIIS2352-3964(24)00071-9/fulltext
