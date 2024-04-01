//IMAGE UPLOAD - STEP 08
//  - Create the Utilities folder in the UI Project
//  - Right click the folder > Add > Class > name it ImageUtility.cs
//  - Copy & paste the code from ImageUtility
//  - Add the using statements below

using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing;

namespace TechLight.UI.MVC.Utilities
{
    public class ImageUtility
    {
        public static void ResizeImage(string savePath, string fileName, Image image, int maxImgSize, int maxThumbSize)
        {
            int[] newImageSizes = GetNewSize(image.Width, image.Height, maxImgSize);
            Bitmap newImage = DoResizeImage(newImageSizes[0], newImageSizes[1], image);
            newImage.Save(savePath + fileName);    
            int[] newThumbSizes = GetNewSize(newImage.Width, newImage.Height, maxThumbSize);
            Bitmap newThumb = DoResizeImage(newThumbSizes[0], newThumbSizes[1], image);
            newThumb.Save(savePath + "t_" + fileName);
            newImage.Dispose(); newThumb.Dispose(); image.Dispose();
        }

        public static int[] GetNewSize(int imgWidth, int imgHeight, int maxImgSize)
        {
            float ratioX = (float)maxImgSize / (float)imgWidth;
            float ratioY = (float)maxImgSize / (float)imgHeight;
            float ratio = Math.Min(ratioX, ratioY);
            int[] newImgSizes = new int[2];
            newImgSizes[0] = (int)(imgWidth * ratio);
            newImgSizes[1] = (int)(imgHeight * ratio);
            return newImgSizes;
        }

        /// <summary>
        /// Perform image resize.
        /// </summary>
        /// <param name="imgWidth">Desired width</param>
        /// <param name="imgHeight">Desired height</param>
        /// <param name="image">Image to be resized</param>
        /// <returns></returns>
        public static Bitmap DoResizeImage(int imgWidth, int imgHeight, Image image)
        {
            Bitmap newImage = new Bitmap(imgWidth, imgHeight, PixelFormat.Format24bppRgb);
            newImage.MakeTransparent();
            newImage.SetResolution(72, 72);
            // Do the resize
            using (Graphics graphics = Graphics.FromImage(newImage))
            {
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.DrawImage(image, 0, 0, imgWidth, imgHeight);
            }
            return newImage;
        }

        public static void Delete(string path, string fileName)
        {

            FileInfo baseFile = new FileInfo(path + fileName);
            FileInfo thumbImg = new FileInfo(path + "t_" + fileName);

            if (baseFile.Exists)
            {
                baseFile.Delete();
            }

            if (thumbImg.Exists)
            {
                thumbImg.Delete();
            }
        }
    }
}
