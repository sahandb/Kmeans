# Kmeans
Implement the K-means clustering algorithm and apply it to compress an image.


I use K-means algorithm to select the 16 colors that will be used to represent the compressed image. Concretely, I treat every pixel in the original image as a data example and use the K-means algorithm to find the 16 colors that best group (cluster) the pixels in the 3-dimensional RGB space. Once I have computed the cluster centroids on the image, then use the 16 colors to replace the pixels in the original image.

![CKmeans](https://user-images.githubusercontent.com/24508376/219875535-34e51c07-07a9-4b84-a963-ecbd500e189c.jpg)
