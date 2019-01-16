package org.casalib.util
{
   public class ConversionUtil
   {
       
      
      public function ConversionUtil()
      {
         super();
      }
      
      public static function bitsToBytes(param1:Number) : Number
      {
         return param1 / 8;
      }
      
      public static function bitsToKilobits(param1:Number) : Number
      {
         return param1 / 1024;
      }
      
      public static function bitsToKilobytes(param1:Number) : Number
      {
         return param1 / 8192;
      }
      
      public static function bytesToBits(param1:Number) : Number
      {
         return param1 * 8;
      }
      
      public static function bytesToKilobits(param1:Number) : Number
      {
         return param1 / 128;
      }
      
      public static function bytesToKilobytes(param1:Number) : Number
      {
         return param1 / 1024;
      }
      
      public static function kilobitsToBits(param1:Number) : Number
      {
         return param1 * 1024;
      }
      
      public static function kilobitsToBytes(param1:Number) : Number
      {
         return param1 * 128;
      }
      
      public static function kilobitsToKilobytes(param1:Number) : Number
      {
         return param1 / 8;
      }
      
      public static function kilobytesToBits(param1:Number) : Number
      {
         return param1 * 8192;
      }
      
      public static function kilobytesToBytes(param1:Number) : Number
      {
         return param1 * 1024;
      }
      
      public static function kilobytesToKilobits(param1:Number) : Number
      {
         return param1 * 8;
      }
      
      public static function millisecondsToSeconds(param1:Number) : Number
      {
         return param1 / 1000;
      }
      
      public static function millisecondsToMinutes(param1:Number) : Number
      {
         return ConversionUtil.secondsToMinutes(ConversionUtil.millisecondsToSeconds(param1));
      }
      
      public static function millisecondsToHours(param1:Number) : Number
      {
         return ConversionUtil.minutesToHours(ConversionUtil.millisecondsToMinutes(param1));
      }
      
      public static function millisecondsToDays(param1:Number) : Number
      {
         return ConversionUtil.hoursToDays(ConversionUtil.millisecondsToHours(param1));
      }
      
      public static function secondsToMilliseconds(param1:Number) : Number
      {
         return param1 * 1000;
      }
      
      public static function secondsToMinutes(param1:Number) : Number
      {
         return param1 / 60;
      }
      
      public static function secondsToHours(param1:Number) : Number
      {
         return ConversionUtil.minutesToHours(ConversionUtil.secondsToMinutes(param1));
      }
      
      public static function secondsToDays(param1:Number) : Number
      {
         return ConversionUtil.hoursToDays(ConversionUtil.secondsToHours(param1));
      }
      
      public static function minutesToMilliseconds(param1:Number) : Number
      {
         return ConversionUtil.secondsToMilliseconds(ConversionUtil.minutesToSeconds(param1));
      }
      
      public static function minutesToSeconds(param1:Number) : Number
      {
         return param1 * 60;
      }
      
      public static function minutesToHours(param1:Number) : Number
      {
         return param1 / 60;
      }
      
      public static function minutesToDays(param1:Number) : Number
      {
         return ConversionUtil.hoursToDays(ConversionUtil.minutesToHours(param1));
      }
      
      public static function hoursToMilliseconds(param1:Number) : Number
      {
         return ConversionUtil.secondsToMilliseconds(ConversionUtil.hoursToSeconds(param1));
      }
      
      public static function hoursToSeconds(param1:Number) : Number
      {
         return ConversionUtil.minutesToSeconds(ConversionUtil.hoursToMinutes(param1));
      }
      
      public static function hoursToMinutes(param1:Number) : Number
      {
         return param1 * 60;
      }
      
      public static function hoursToDays(param1:Number) : Number
      {
         return param1 / 24;
      }
      
      public static function daysToMilliseconds(param1:Number) : Number
      {
         return ConversionUtil.secondsToMilliseconds(ConversionUtil.daysToSeconds(param1));
      }
      
      public static function daysToSeconds(param1:Number) : Number
      {
         return ConversionUtil.minutesToSeconds(ConversionUtil.daysToMinutes(param1));
      }
      
      public static function daysToMinutes(param1:Number) : Number
      {
         return ConversionUtil.hoursToMinutes(ConversionUtil.daysToHours(param1));
      }
      
      public static function daysToHours(param1:Number) : Number
      {
         return param1 * 24;
      }
      
      public static function degreesToRadians(param1:Number) : Number
      {
         return param1 * (Math.PI / 180);
      }
      
      public static function radiansToDegrees(param1:Number) : Number
      {
         return param1 * (180 / Math.PI);
      }
   }
}
