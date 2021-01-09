package com.playata.application.ui.elements.avatar
{
   import com.playata.application.data.character.AvatarImageSettings;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.data.IByteArray;
   import com.playata.framework.display.flash.FlashDisplayUtil;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.filters.BlurFilter;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class AvatarImage
   {
      
      private static const SymbolAvatarImagePreviewMask:Class = §aib_1_png$013c7fd71690f42c5be14bbf3f11c0a5-1072399967§;
      
      private static var _avatarImagePreviewMask:BitmapData = null;
      
      private static var AVATAR_RECTS:Object = {
         "m":{
            1:{
               "x":-97,
               "y":-15,
               "scale":0.75
            },
            2:{
               "x":-80,
               "y":-380,
               "scale":1
            },
            3:{
               "x":-35,
               "y":-35,
               "scale":0.575
            },
            4:{
               "x":-25,
               "y":-310,
               "scale":0.8
            }
         },
         "f":{
            1:{
               "x":-98,
               "y":-45,
               "scale":0.75
            },
            2:{
               "x":-160,
               "y":-190,
               "scale":1
            },
            3:{
               "x":-71,
               "y":-45,
               "scale":0.65
            },
            4:{
               "x":-190,
               "y":-350,
               "scale":1
            }
         }
      };
      
      private static var Z:Point = new Point();
      
      private static var GREYSCALE:ColorMatrixFilter = new ColorMatrixFilter([0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0.3,0.59,0.11,0,0,0,0,0,1,0]);
      
      private static var HAMILTON_MASK1:BitmapData = new SymbolHamiltonBlurFilterMask1();
      
      private static var HAMILTON_MASK2:BitmapData = new SymbolHamiltonBlurFilterMask2();
      
      private static var HAMILTON_BLUR1:BlurFilter = new BlurFilter(4,4,3);
      
      private static var HAMILTON_BLUR2:BlurFilter = new BlurFilter(2,2,3);
      
      private static var HAMILTON_COLOR:ColorMatrixFilter = new ColorMatrixFilter([0.8401348,0.1937892,0.026076,0,12.09,0.0981348,0.9357892,0.026076,0,12.09,0.0981348,0.1937892,0.768076,0,12.09,0,0,0,1,0]);
      
      private static var LOMO_FILTER:ColorMatrixFilter = new ColorMatrixFilter([1.15,0,0,0,0,0,1.18,0,0,0,0,0,1.05,0,0,0,0,0,1,0]);
      
      private static var LOMO_VIGNETTE:BitmapData = new SymbolLomoVignette();
       
      
      private var _settings:AvatarImageSettings;
      
      private var _onGenerated:Function = null;
      
      private var _previewBitmapData:BitmapData;
      
      private var _preview:Bitmap;
      
      private var _bottom:SymbolAvatarImagePreviewBottom;
      
      private var _top:SymbolAvatarImagePreviewTop;
      
      private var _mask:BitmapData;
      
      public function AvatarImage()
      {
         var _loc1_:* = null;
         super();
         _previewBitmapData = new BitmapData(160,160,true,0);
         _preview = new Bitmap(_previewBitmapData,"auto",true);
         if(_avatarImagePreviewMask == null)
         {
            _loc1_ = new SymbolAvatarImagePreviewMask();
            _avatarImagePreviewMask = _loc1_.bitmapData;
         }
         _bottom = new SymbolAvatarImagePreviewBottom();
         _mask = _avatarImagePreviewMask;
         _top = new SymbolAvatarImagePreviewTop();
      }
      
      private static function removeAllChildren(param1:MovieClip) : void
      {
         var _loc4_:int = 0;
         var _loc3_:Vector.<DisplayObject> = new Vector.<DisplayObject>();
         _loc4_ = 0;
         while(_loc4_ < param1.numChildren)
         {
            _loc3_.push(param1.getChildAt(_loc4_));
            _loc4_++;
         }
         var _loc6_:int = 0;
         var _loc5_:* = _loc3_;
         for each(var _loc2_ in _loc3_)
         {
            param1.removeChild(_loc2_);
         }
      }
      
      public function dispose() : void
      {
         if(_previewBitmapData != null)
         {
            _previewBitmapData.dispose();
            _previewBitmapData = null;
         }
      }
      
      public function getBitMapdataByteArray(param1:Number, param2:Rectangle) : IByteArray
      {
         return FlashDisplayUtil.getFlashDisplayObjectAsByteArray(_preview,param1,param2,null);
      }
      
      public function get preview() : Bitmap
      {
         return _preview;
      }
      
      public function generateFromCompressedSettings(param1:String, param2:Function) : void
      {
         if(param1 == null || param1 == "")
         {
            return;
         }
         generate(AvatarImageSettings.decodeAvatarImageSettings(param1),param2);
      }
      
      public function generate(param1:AvatarImageSettings, param2:Function) : void
      {
         if(param1 == null)
         {
            return;
         }
         _settings = param1;
         _onGenerated = param2;
         startPreviewGeneration();
      }
      
      private function startPreviewGeneration() : void
      {
         if(!PreviewAvatar.lockPreviewAvatar(this))
         {
            Runtime.delayFunction(startPreviewGeneration,0.1);
            return;
         }
         removeAllChildren(_bottom.avatar);
         PreviewAvatar.updatePreviewAvatar(_settings,this);
         _bottom.avatar.addChild(PreviewAvatar.getPreviewAvatar(this));
         checkIfPreviewLoaded();
      }
      
      private function checkIfPreviewLoaded() : void
      {
         if(!PreviewAvatar.previewComplete(this))
         {
            Runtime.delayFunction(checkIfPreviewLoaded,0.1);
            return;
         }
         makePreview();
      }
      
      private function makePreview() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         _previewBitmapData.lock();
         _previewBitmapData.fillRect(_previewBitmapData.rect,872349696);
         var _loc3_:Object = AVATAR_RECTS[_settings.gender][_settings.photo_rect_type];
         var _loc4_:* = _loc3_["scale"];
         _bottom.avatar.scaleY = _loc4_;
         _bottom.avatar.scaleX = _loc4_;
         _bottom.avatar.x = _loc3_["x"];
         _bottom.avatar.y = _loc3_["y"];
         _bottom.gotoAndStop(_settings.photo_background_type);
         _previewBitmapData.draw(_bottom);
         switch(int(_settings.photo_filter_type) - 2)
         {
            case 0:
               _previewBitmapData.applyFilter(_previewBitmapData,_previewBitmapData.rect,Z,GREYSCALE);
               break;
            case 1:
               _loc2_ = _previewBitmapData.clone();
               _loc1_ = _loc2_.clone();
               _loc1_.applyFilter(_loc1_,_loc1_.rect,Z,HAMILTON_BLUR1);
               _previewBitmapData.copyPixels(_loc1_,_loc1_.rect,Z,HAMILTON_MASK1,null,true);
               _previewBitmapData.copyPixels(_loc1_,_loc1_.rect,Z,HAMILTON_MASK1,null,true);
               _previewBitmapData.copyPixels(_loc1_,_loc1_.rect,Z,HAMILTON_MASK1,null,true);
               _loc1_.copyPixels(_loc2_,_loc2_.rect,Z);
               _loc1_.applyFilter(_loc1_,_loc1_.rect,Z,HAMILTON_BLUR2);
               _previewBitmapData.copyPixels(_loc1_,_loc1_.rect,Z,HAMILTON_MASK2,null,true);
               _previewBitmapData.applyFilter(_previewBitmapData,_previewBitmapData.rect,Z,HAMILTON_COLOR);
               _loc1_.dispose();
               _loc1_ = null;
               _loc2_.dispose();
               _loc2_ = null;
               break;
            case 2:
               _previewBitmapData.applyFilter(_previewBitmapData,_previewBitmapData.rect,Z,LOMO_FILTER);
               _previewBitmapData.copyPixels(LOMO_VIGNETTE,LOMO_VIGNETTE.rect,Z,null,null,true);
         }
         _previewBitmapData.copyPixels(_previewBitmapData,_previewBitmapData.rect,Z,_mask);
         _top.border.gotoAndStop(_settings.photo_border_type);
         _top.icon.gotoAndStop(_settings.photo_icon_type);
         if(_settings.hasData("photo_sexuality_type"))
         {
            _top.sexuality.gotoAndStop(_settings.photo_sexuality_type);
         }
         else
         {
            _top.sexuality.gotoAndStop(1);
         }
         _previewBitmapData.draw(_top);
         _previewBitmapData.unlock();
         _preview.smoothing = true;
         PreviewAvatar.unlockPreviewAvatar(this);
         if(_onGenerated != null)
         {
            _onGenerated();
         }
      }
   }
}
