PROJECT REPORT:
(K Maheshwari, J Sowmya Vasuki, M S Shruthi, Ch Mounika)
Topic: Breast Cancer Analysis and Classification Using Segmentation Techniques
BRIEF DESCRIPTION: • In this project, we will be doing a Breast Cancer Histopathological Image Classification. Cancer is a significant public health problem in the world today. In particular, breast cancer (BC) is one of most common types of cancer among women and biopsy is the only way to diagnose with confidence if the cancer is really present. So, in this project will be doing the classification based on the biopsy images and so we have chosen the dataset accordingly. • The dataset(BreakHis) used is composed of microscopic images of breast tumour tissue collected from patients using different magnifying factors (40X, 100X and 400X). The dataset BreaKHis is divided into two main groups: benign tumours and malignant tumours.
• Histologically benign is a term referring to a lesion that does not match any criteria of malignancy – e.g., marked cellular atypia, mitosis, disruption of basement membranes, metastasize, etc. Normally, benign tumours are relatively “innocents”, presents slow growing and remains localized. Malignant tumour is a synonym for cancer: lesion can invade and destroy adjacent structures (locally invasive) and spread to distant sites (metastasize) to cause death.
• In current version, samples present in dataset were collected by SOB method, also named partial mastectomy or excisional biopsy. This type of procedure, compared to any methods of needle biopsy, removes the larger size of tissue sample and is done in a hospital with general anaesthetic.
(a) Sample images from the dataset • In the next step we convert the images of the dataset into black and white images which gives us a clearer picture of segmentation after the process has been applied on it. (b) Sample images after converting to black and white
• We will be doing segmentation of the given image which is a black and white biopsy image and we will eliminate unwanted noise in that image.
• Generally, Segmentation can be done using different kind of methods. For example, Otsu’s method, K-means clustering, watershed segmentation, texture filters etc.
• Each cell is an ellipse and finding features like eccentricity of these ellipses, variance of eccentricities will help us detect whether the tissue image belongs to the breast cancer set. Our main motto will be stacking up the following features for the classification.
Feature 1: Mean of eccentricities of ellipses
Feature 2: variances of the eccentricity
Feature 3: kurtosis of the eccentricity
Feature 4: skewness of eccentricity
Feature 5: Formation of closed chain
• We will find out all these features and plot them to show different values for benign and malignant tumours.
Based on the plots we obtain, we will be able to find the characteristics based on which we will be able classify the tumour as benign or malignant.
