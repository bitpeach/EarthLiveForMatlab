# What is EarthLiveForMatlab

EarthLive is a function program of displaying live pictures of earth on our PC desktop, in every 10 minutes. The live photos of global earth map are pictured by the satellite named ’Himawari8’. The Python version of EarthLive for running on the mac has been finished by me, which adopts sub-pictures comprising of 4 parts. Now, the matlab version has been complemented. The function of processing pictures by Matlab is weaker than Python. Hence, there are several problems existing on displaying the live earth wallpaper. This Matlab program is a simple code to use 64 real-time sub-picture parts of earth for the PC wallpaper as the follow, which are larger and clearer than other counterparts.
![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/Wallpaper%20(win10).PNG)


Nice for Homework!
![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/A%20boat.jpg)

# How does EarthLive program work
* The live images or real-time pictures of earth are photographed by the satellite. We should download or take the pictures from the website or date store of satellite. Notice that the pictures are incoherent. In other words, several pictures comprise a complete earth.

* After the images are downloaded, we program in Matlab codes to combine the pictures into the whole earth.

# How to download pictures from Himawari8 satellite
* A whole earth picture may be comprised of several sub-pictures with specific pixels and different positions of earth. If four sub-pictures comprise a complete photo of earth, we can denote this situation as the 2 dimensions. The Himawari8 satellite provides 8 dimensions as the top situation.

* The URL format of a sub-picture is shown as the follow.
</br>`himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2016/05/15/100000_0_0.png`

* That means that regulatory format can be wwritten as 'img/D531106/[%accuracy]/550/[%year]/[%month]/[%day]/[%hour%min%sec][%row position][%column position].png'

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
* Firstly, solve the JSON format file from 'http://himawari8.nict.go.jp/img/D531106/latest.json'. For Matlab, the JSON file resolving is a time-consuming job. We should write a JSON reading Matlab function script whereas Python has a standard function or interface. Regular expressions of Matlab codes have been tried.

* Secondly, use the CDN to help downloading the pictures. Using CDN function is to fetch the remote web link as the following situation, where interface URL is shown as 'himawari8-dl.nict.go.jp/himawari8/img/D531106/8d/550/2016/05/15/100000_0_0.png'. 
</br>`http://res.cloudinary.com/[%Your_Cloud_Account_Name]/image/fetch/[%interface URL]`

* Thirdly, combine the 64 sub-pictures into the complete earth picture. We discovered the types of sub-pictures are different, such as the parts of the complete earth picture, namely several sub-pictures, are comprised of gray images, not RGB images. In other words, the Matlab matrix may be in 2 dimensions of gray images but 3 dimension of RGB images. Gray images may not be transformed into RGB images because of the image information loss. We ventured the idea that the Matlab matrix will be forced into 3-dimension zero matrix, when we recognized gray images. Due to the lack of image process combination by Matlab, we transferred different images into one matrix within uint values.

* Fourthly, design a simple GUI by Matlab.

![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/Matlab%20GUI.png)

* Then, get a complete high-definition picture of live earth. Excited!

* Sixly, you can input your the pixels of desktop wallpaper into the GUI. The resized wallpaper which is matching for your desktop will be produced.

* Finally, for Windows 10 system, this code writes a final picture to your `C:\Users\%computer account username%\Pictures\Camera Roll`. The Matlab has limitations on calling for the system command or powershell command lines. So that the way to save the final earth live picture in that filepath may be the solution.

# The Example
* 64 sub-pictures of 8 dimensions comprise a complete earth.
May 10, 12:00, 2017. The following picture can be used as the wallpaper of the 4K display.
![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/2017_05_10_12_30_00.png)

May 11, 20:00, 2017.
 ![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/2017_05_11_20_00_00.png)
 
 * Imagine the shadow of live earth on your PC wallpaper may be rotated around every 10 minutes.
 (Please wait for a moment. The following picture is animated.)
 If you cannot watch this GIF by mobile phone, please use the personal computer. :-)
 ![](https://github.com/bitpeach/EarthLiveForMatlab/blob/master/EarthLive.gif)

# The Limitation of EarthLiveForMatlab
* This Code is for fun. Therefore, this script or tool is just beginning and we wait for more friends to help polishing this code. Thank you.

# License
[GNU General Public License, version 3](LICENSE)

# Finally
` Be careful to use Powershell with Matlab for setting this wallpaper of Windows 10.`

` When I tried to use the Powershell, this version of Matlab code has been failed.`

` The Registry Editor or system setting of my computer was damaged.`

` My default desktop wallpaper was disappeared irreversibly and un-resetting in Windows 10.`

` 将来代码功能上有什么偏差，造成了系统桌面壁纸消失，不可逆转恢复，你们自己是要负责的。蛤?`

` All men must die. All men must serve. All things must be with the basic law.` 

By @bitpeach
