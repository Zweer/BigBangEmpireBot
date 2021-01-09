package starling.text
{
   import flash.geom.Matrix;
   import starling.display.MeshBatch;
   import starling.display.Quad;
   import starling.styles.MeshStyle;
   import starling.textures.Texture;
   import starling.utils.MathUtil;
   import starling.utils.SystemUtil;
   
   public class TrueTypeCompositor implements ITextCompositor
   {
      
      private static var sHelperMatrix:Matrix = new Matrix();
      
      private static var sHelperQuad:Quad = new Quad(100,100);
      
      private static var sNativeTextField:flash.text.TextField = new flash.text.TextField();
      
      private static var sNativeFormat:flash.text.TextFormat = new flash.text.TextFormat();
       
      
      public function TrueTypeCompositor()
      {
         super();
      }
      
      private static function autoScaleNativeTextField(param1:flash.text.TextField, param2:String, param3:Boolean) : void
      {
         var _loc7_:flash.text.TextFormat = param1.defaultTextFormat;
         var _loc5_:int = param1.width - 4;
         var _loc6_:int = param1.height - 4;
         var _loc4_:Number = _loc7_.size;
         while(param1.textWidth > _loc5_ || param1.textHeight > _loc6_)
         {
            if(_loc4_ > 4)
            {
               _loc4_--;
               _loc7_.size = _loc4_;
               param1.defaultTextFormat = _loc7_;
               if(param3)
               {
                  param1.htmlText = param2;
               }
               else
               {
                  param1.text = param2;
               }
               continue;
            }
            break;
         }
      }
      
      private static function snapToPixels(param1:Number, param2:Number) : Number
      {
         var _loc3_:Number = NaN;
         if(param1 == 0 || param2 == 0)
         {
            return param1;
         }
         _loc3_ = 1 / param2;
         return Math.round(param1 / _loc3_) * _loc3_;
      }
      
      public function dispose() : void
      {
      }
      
      public function fillMeshBatch(param1:MeshBatch, param2:Number, param3:Number, param4:String, param5:starling.text.TextFormat, param6:TextOptions = null) : void
      {
         meshBatch = param1;
         width = param2;
         height = param3;
         text = param4;
         format = param5;
         options = param6;
         if(text == null || text == "")
         {
            return;
         }
         var textureFormat:String = options.textureFormat;
         var bitmapData:BitmapDataEx = renderText(width,height,text,format,options);
         var texture:Texture = Texture.fromBitmapData(bitmapData,false,false,bitmapData.scale,textureFormat);
         texture.root.onRestore = function():void
         {
            bitmapData = renderText(width,height,text,format,options);
            texture.root.uploadBitmapData(bitmapData);
            bitmapData.dispose();
            bitmapData = null;
         };
         bitmapData.dispose();
         bitmapData = null;
         sHelperQuad.texture = texture;
         sHelperQuad.readjustSize();
         if(format.horizontalAlign == "left")
         {
            sHelperQuad.x = 0;
         }
         else if(format.horizontalAlign == "center")
         {
            sHelperQuad.x = (width - texture.width) / 2;
         }
         else
         {
            sHelperQuad.x = width - texture.width;
         }
         if(format.verticalAlign == "top")
         {
            sHelperQuad.y = 0;
         }
         else if(format.verticalAlign == "center")
         {
            sHelperQuad.y = (height - texture.height) / 2;
         }
         else
         {
            sHelperQuad.y = height - texture.height;
         }
         sHelperQuad.x = snapToPixels(sHelperQuad.x,options.textureScale);
         sHelperQuad.y = snapToPixels(sHelperQuad.y,options.textureScale);
         meshBatch.addMesh(sHelperQuad);
         sHelperQuad.texture = null;
      }
      
      public function clearMeshBatch(param1:MeshBatch) : void
      {
         param1.clear();
         if(param1.texture)
         {
            param1.texture.dispose();
            param1.texture = null;
         }
      }
      
      public function getDefaultMeshStyle(param1:MeshStyle, param2:starling.text.TextFormat, param3:TextOptions) : MeshStyle
      {
         return null;
      }
      
      private function renderText(param1:Number, param2:Number, param3:String, param4:starling.text.TextFormat, param5:TextOptions) : BitmapDataEx
      {
         var _loc14_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc19_:* = null;
         var _loc7_:Number = param5.textureScale;
         var _loc8_:Number = param1 * _loc7_;
         var _loc18_:Number = param2 * _loc7_;
         var _loc6_:String = param4.horizontalAlign;
         param4.toNativeFormat(sNativeFormat);
         sNativeFormat.size = sNativeFormat.size * _loc7_;
         sNativeTextField.embedFonts = SystemUtil.isEmbeddedFont(param4.font,param4.bold,param4.italic);
         sNativeTextField.styleSheet = null;
         sNativeTextField.defaultTextFormat = sNativeFormat;
         sNativeTextField.styleSheet = param5.styleSheet;
         sNativeTextField.width = _loc8_;
         sNativeTextField.height = _loc18_;
         sNativeTextField.antiAliasType = "advanced";
         sNativeTextField.selectable = false;
         sNativeTextField.multiline = true;
         sNativeTextField.wordWrap = param5.wordWrap;
         if(param5.isHtmlText)
         {
            sNativeTextField.htmlText = param3;
         }
         else
         {
            sNativeTextField.text = param3;
         }
         if(param5.autoScale)
         {
            autoScaleNativeTextField(sNativeTextField,param3,param5.isHtmlText);
         }
         var _loc11_:int = 1;
         var _loc9_:int = Texture.getMaxSize(param5.textureFormat);
         var _loc12_:Number = param5.padding * _loc7_;
         var _loc20_:Number = param5.padding * _loc7_;
         var _loc10_:Number = sNativeTextField.textWidth + 4;
         var _loc13_:Number = sNativeTextField.textHeight + 4;
         var _loc15_:int = Math.ceil(_loc10_) + 2 * _loc12_;
         var _loc17_:int = Math.ceil(_loc13_) + 2 * _loc20_;
         if(_loc15_ > _loc8_)
         {
            _loc12_ = MathUtil.max(0,(_loc8_ - _loc10_) / 2);
            _loc15_ = Math.ceil(_loc8_);
         }
         if(_loc17_ > _loc18_)
         {
            _loc20_ = MathUtil.max(0,(_loc18_ - _loc13_) / 2);
            _loc17_ = Math.ceil(_loc18_);
         }
         if(param5.isHtmlText)
         {
            _loc15_ = _loc8_;
            _loc10_ = _loc8_;
         }
         if(_loc15_ < _loc11_)
         {
            _loc15_ = 1;
         }
         if(_loc17_ < _loc11_)
         {
            _loc17_ = 1;
         }
         if(_loc17_ > _loc9_ || _loc15_ > _loc9_)
         {
            param5.textureScale = param5.textureScale * (_loc9_ / Math.max(_loc15_,_loc17_));
            return renderText(param1,param2,param3,param4,param5);
         }
         _loc14_ = -_loc12_;
         _loc16_ = -_loc20_;
         if(!param5.isHtmlText)
         {
            if(_loc6_ == "right")
            {
               _loc14_ = _loc8_ - _loc10_ - _loc12_;
            }
            else if(_loc6_ == "center")
            {
               _loc14_ = (_loc8_ - _loc10_) / 2 - _loc12_;
            }
         }
         _loc19_ = new BitmapDataEx(_loc15_,_loc17_);
         sHelperMatrix.setTo(1,0,0,1,-_loc14_,-_loc16_);
         _loc19_.draw(sNativeTextField,sHelperMatrix);
         _loc19_.scale = _loc7_;
         sNativeTextField.text = "";
         return _loc19_;
      }
   }
}

import flash.display.BitmapData;

class BitmapDataEx extends BitmapData
{
    
   
   private var _scale:Number = 1.0;
   
   function BitmapDataEx(param1:int, param2:int, param3:Boolean = true, param4:uint = 0)
   {
      super(param1,param2,param3,param4);
   }
   
   public function get scale() : Number
   {
      return _scale;
   }
   
   public function set scale(param1:Number) : void
   {
      _scale = param1;
   }
}
