package com.playata.framework.advertisement
{
   import com.playata.framework.core.enum.Enum;
   
   public class AdType extends Enum
   {
      
      public static const OFFERWALL:AdType = new AdType();
      
      public static const INTERSTITIAL:AdType = new AdType();
      
      public static const VIDEO:AdType = new AdType();
      
      {
         initEnum(AdType);
      }
      
      public function AdType()
      {
         super();
      }
   }
}
