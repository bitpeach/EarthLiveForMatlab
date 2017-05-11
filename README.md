# What is EarthLiveForMatlab

EarthLive is a function program of displaying live pictures of earth on our PC desktop, in every 10 minutes. The live photos of global earth map are pictured by the satellite named ’Himawari8’. The Python version of EarthLive for running on the mac has been finished by me, which adopts sub-pictures comprising of 4 parts. Now, the matlab version has been complemented. The function on processing pictures by Matlab is weaker than Python. Hence, there are several problems existing in displaying the live earth wallpaper. This Matlab program is a simple code to use 64 real-time sub-picture parts of earth for the PC wallpaper, which are larger and clearer than other counterparts.

# How does EarthLive program works
* The live images or real-time pictures of earth are photographed by the satellite. We should download or take the pictures from the website or date store of satellite. Notice that the pictures are incoherent. In other words, several pictures comprise a complete earth.

* After the images are downloaded, we program in Matlab codes to combine the pictures into the whole earth.

# How to download pictures from Himawari8 satellite
* A whole earth picture may be comprised of several sub-pictures with specific pixels and different positions of earth. If four sub-pictures comprises a complete photo of earth, we can denote this situations as the 2 dimensions. The Himawari8 satellite provides 8 dimensions as the top situation.

* The URL format of a sub-picture is shown as the follow.
</br>`himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2016/05/15/100000_0_0.png`

* That means that regulatory format can be writed as 'img/D531106/[%accuracy]/550/[%year]/[%month]/[%day]/[%hour%min%sec][%row position][%column position].png'

* If [%accuracy] is set as `8d`, we should download the 64 sub-pictures using those 64 URLS as follows.
 </br>`http://himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2017/05/10/045000_0_0.png`</br>
`http://himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2017/05/10/045000_0_1.png`</br>
`......` </br>
`http://himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2017/05/10/045000_0_7.png`</br>
`http://himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2017/05/10/045000_1_0.png`</br>
`......` </br>
`http://himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2017/05/10/045000_1_7.png`</br>
`......` </br>
`http://himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2017/05/10/045000_7_0.png`</br>
  It means that the complete picture consists of the 64 pictures above. The time of these sub-pictures captured by Himawari8 is 12:50:00 AM (GMT +8 hours), May 10th, 2017. The '04:50 AM' is the Greenwich Mean Time. All these sub-pictures are in 550x550 pixels.
  
 * Here is an example of the sub-picture named '8d_550_2017_05_10_045000_0_3.png', which is part of the earth.
 
 ![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/8d_550_2017_05_10_045000_0_3.png)
 
 * We can use the Matlab function 'urlread(URL)' to download those sub-pictures. Also, we can use the CDN to help us downloading those sub-pictures for avoiding the failed downlink.
 
 # The running steps of Matlab Codes
* Firstly, solve the JSON format file from 'http://himawari8.nict.go.jp/img/D531106/latest.json'. For Matlab, the JSON file resolving is a time-consuming job. We should write a JSON reading Matlab function script whereas Python has a standard function or interface. Regular expressions in Matlab codes have been tried.

* Secondly, use the CDN to help downloading the pictures. Using CDN function is to fetch the remote web link as the following situaion, where interface URL is shown as 'himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2016/05/15/100000_0_0.png'. 
</br>`http://res.cloudinary.com/[%Your_Cloud_Account_Name]/image/fetch/[%interface URL]`

* Thirdly, combine the 64 sub-pictures into the complete earth picture. We discovered the types of sub-pictures are different, such as the parts of the complete eartch picture, namely several sub-pictures, are comprised from gray images, not RGB images. In other words, the Matlab matrix may be in 2 dimensions of gray images but 3 dimension of RGB images. Gray images may not be transformed into RGB images because of the image information loss. We ventured the idea that the Matlab matrix will be forced into 3-dimension zero matrix, when we recognized gray images. Due to the lack of image process combination in Matlab code, we transferred the image into the matrix within uint vaules.

* Then, design a simple GUI by Matlab.

![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/Matlab%20GUI.png)

* Finally, get a complete high-definition picture of live earth. Excited!

 # The Example
* 64 sub-pictures of 8 dimensions comprises a complete earth.
May 10, 12:00, 2017. The follwing picture can be used as the wallpaper of the 4K display.
![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/2017_05_10_12_30_00.png)

May 11, 20:00, 2017.
 ![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/2017_05_11_20_00_00.png)
 
 * Imagine the shadow of live earth on your PC wallpaper may be rotated in every 10 minutes.
 ![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/EarthLive.gif)

# The Limitation of EarthLiveForMatlab
* This Coding is for fun. Therefore, this script or tool is just beginning and we wait for more friends to help polishing this code. Thank you.
