package com.playata.framework.display.lib.flash
{
   import com.playata.framework.core.error.Exception;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.display.ui.TextFieldAutoAdjustWidthHeight;
   import com.playata.framework.display.ui.TextInputType;
   
   public final class FlashTypeConverter
   {
       
      
      public function FlashTypeConverter()
      {
         super();
      }
      
      public static function fromFlashAlign(param1:String) : Align
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "center":
               return Align.CENTER;
            case "top":
               return Align.TOP;
            case "left":
               return Align.LEFT;
            case "right":
               return Align.RIGHT;
            case "bottom":
               return Align.BOTTOM;
            default:
               throw new Exception("unknown Align");
         }
      }
      
      public static function toFlashAlign(param1:Align) : String
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case Align.CENTER:
               return "center";
            case Align.TOP:
               return "top";
            case Align.LEFT:
               return "left";
            case Align.RIGHT:
               return "right";
            case Align.BOTTOM:
               return "bottom";
            default:
               throw new Exception("unknown Align");
         }
      }
      
      public static function fromFlashAutoAdjustWidthHeight(param1:String) : TextFieldAutoAdjustWidthHeight
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "none":
               return TextFieldAutoAdjustWidthHeight.NONE;
            case "left":
               return TextFieldAutoAdjustWidthHeight.HORIZONTAL;
            case "right":
               return TextFieldAutoAdjustWidthHeight.HORIZONTAL;
            case "center":
               return TextFieldAutoAdjustWidthHeight.HORIZONTAL;
            default:
               throw new Exception("unknown TextFieldAutoAdjustWidthHeight");
         }
      }
      
      public static function toFlashAutoAdjustWidthHeight(param1:TextFieldAutoAdjustWidthHeight) : String
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case TextFieldAutoAdjustWidthHeight.NONE:
               return "none";
            case TextFieldAutoAdjustWidthHeight.VERTICAL:
               return "none";
            case TextFieldAutoAdjustWidthHeight.HORIZONTAL:
               return "left";
            case TextFieldAutoAdjustWidthHeight.BOTH_DIRECTIONS:
               return "none";
            default:
               throw new Exception("unknown TextFieldAutoAdjustWidthHeight");
         }
      }
      
      public static function fromFlashTextInputType(param1:String) : TextInputType
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case "default":
               return TextInputType.DEFAULT;
            case "punctuation":
               return TextInputType.PUNCTUATION;
            case "url":
               return TextInputType.URL;
            case "number":
               return TextInputType.NUMBER;
            case "contact":
               return TextInputType.CONTACT;
            case "email":
               return TextInputType.EMAIL;
            default:
               throw new Exception("unknown TextInputType");
         }
      }
      
      public static function toFlashTextInputType(param1:TextInputType) : String
      {
         var _loc2_:* = param1;
         switch(_loc2_)
         {
            case TextInputType.DEFAULT:
               return "default";
            case TextInputType.PUNCTUATION:
               return "punctuation";
            case TextInputType.URL:
               return "url";
            case TextInputType.NUMBER:
               return "number";
            case TextInputType.CONTACT:
               return "contact";
            case TextInputType.EMAIL:
               return "email";
            default:
               throw new Exception("unknown TextInputType");
         }
      }
   }
}
