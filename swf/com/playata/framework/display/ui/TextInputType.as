package com.playata.framework.display.ui
{
   import com.playata.framework.core.enum.Enum;
   
   public class TextInputType extends Enum
   {
      
      public static const DEFAULT:TextInputType = new TextInputType();
      
      public static const PUNCTUATION:TextInputType = new TextInputType();
      
      public static const URL:TextInputType = new TextInputType();
      
      public static const NUMBER:TextInputType = new TextInputType();
      
      public static const CONTACT:TextInputType = new TextInputType();
      
      public static const EMAIL:TextInputType = new TextInputType();
      
      {
         initEnum(TextInputType);
      }
      
      public function TextInputType()
      {
         super();
      }
   }
}
