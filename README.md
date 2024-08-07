# Edge-Detection-and-Color-Separation
## Overview

This project explores the combined use of edge detection and color separation techniques to enhance image processing. It demonstrates how both techniques can be used together for better results in scenarios where either text or color is more important.

## Getting Started

### Prerequisites

- MATLAB installed on your computer.
- Basic knowledge of MATLAB scripting.

### Instructions

1. **Clone the repository:**
    ```
   git clone https://github.com/yourusername/edge-detection-and-color-separation.git
   ```
    - Open the MATLAB script (EDCS.m) in MATLAB.

2. **Run the script and follow the prompts:**

    - Load an image.

    - The script uses an edge detection and color separation technique to enhance image processing for scenarios where text and color recognition are critical.

    - The result will **NOT** be saved but will be displayed in an external image display window in MATLAB.

#### Files in the Repository
1. EDCS.m: The MATLAB script that performs the edge detection and color separation.

2. cone_comparison.png: This is a side by side comparison of the original image and the output of some cones on a track after the script.

3. car_comparison.png: This is a side by side comparison of the original image and the output of a car after the script.


## How it works

### Edge Detection
- **Grayscale Conversion**: The input image is converted to grayscale to simplify edge detection.

- **Edge Detection Algorithm**: Using the Canny algorithm/ Method, the script identifies the edges within the grayscale image.

- **Edge Mask**: An edge mask is created to highlight the boundaries and text within the image.

### Color Separation
- **Color Space Conversion**: The input image is converted from RGB to a different color space (HSV), to facilitate color separation.

- **Color Thresholding**: Specific color ranges are isolated using thresholding techniques to create a color mask that highlights the target colors.

- **Color Mask**: The color mask isolates the relevant colors, such as red for the car or orange for the cones.

### Combining Edge Detection and Color Separation
- **Mask Combination**: The edge mask and color mask are combined to produce a final output that highlights both edges and colors.

- **Noise Reduction**: Techniques like morphological operations are applied to reduce noise introduced by combining both masks. You'll find out that at around line 68, this part of the code has been commented and this is because I don't think the noise reduction filter does a good job but it's there if you want to check it out and tweak it like I just did

- **Result Analysis:** The final image is analyzed to extract useful information, such as license plate numbers or lane boundaries.

By strategically using both edge detection and color separation, this project achieves precise image processing tailored to the specific needs of different scenarios.

## Why Edge Detection and Color Separation Together?

Edge detection is useful for identifying boundaries and text, while color separation highlights specific colors. using both techniques together can sometimes introduce noise so deciding when to use each technique is crucial. Their combination can be used in very rare and specific cases like:

1. **License Plate Recognition for a Red Car:** Extracting the license number of a red car where both text and color are important, especially when the car is amidst other colors of cars.

2. **Lane Keeping with Orange Cones:** Ensuring an autonomous vehicle stays on the road within lanes marked by orange cones, where both lanes and color are important. Edge detection marks the lanes, and color separation identifies the relevant cone color.

## Challenges and Solutions

- Combining edge detection and color separation can create more noise. If the color is more important, avoid using the edge mask. Conversely, if text is crucial, edge detection alone might suffice.

- A big hurdle was tweaking each function; their various methods and sensitivities.

## Results and Insights

Using these techniques together brought out the best in both worlds. We could spot the license plate ( although it wasn't as contrasty, it was still able to identify the text's edges) on that red car and keep our make believe autonomous vehicle on track with the orange cones. It’s like giving your image processing the eyesight of an eagle and the taste buds of a wine taster.

## Key Takeaways

- Use edge detection where shapes and geometrical patterns are high priority.
- Use color separation when specific colors are critical.
- Combining both can enhance results but might be noisy.

## Photo Credits
- Cone Photo by NewAfrica on [Depositphotos](https://st.depositphotos.com/16122460/53628/i/1600/depositphotos_536283692-stock-photo-modern-car-driving-school-test.jpg)

- Car Photo by Joshua on [Pexels](https://www.pexels.com/photo/a-red-vintage-car-12147106/)