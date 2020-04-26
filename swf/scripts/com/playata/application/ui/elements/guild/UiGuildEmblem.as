package com.playata.application.ui.elements.guild
{
   import com.playata.application.data.guild.GuildEmblemSettings;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.IUriSprite;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.filter.DropShadowFilter;
   import com.playata.framework.display.filter.TintFilter;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import com.playata.framework.display.lib.flash.FlashMovieClip;
   import com.playata.framework.input.InteractionEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   
   public class UiGuildEmblem extends InteractiveDisplayObject
   {
       
      
      private var _content:SymbolGuildEmblemGeneric = null;
      
      private var _settings:GuildEmblemSettings = null;
      
      private var _tooltip:UiTextTooltip = null;
      
      private var _enableButton:Boolean = false;
      
      private var _onClickCallback:Function = null;
      
      private var _emblemWidth:int = 0;
      
      private var _emblemHeight:int = 0;
      
      private var _originalX:Number = 0;
      
      private var _originalY:Number = 0;
      
      private var _buttonModeX:Number = 0;
      
      private var _buttonModeY:Number = 0;
      
      private var _maxInstances:int = 1;
      
      private var _gradient:Shape = null;
      
      private var _maskLayer:Sprite = null;
      
      private var _iconLayer:Sprite = null;
      
      public function UiGuildEmblem(param1:SymbolGuildEmblemGeneric, param2:GuildEmblemSettings, param3:int, param4:int, param5:Function = null, param6:Boolean = true, param7:int = 1)
      {
         _content = param1;
         super(_content);
         _settings = param2;
         _onClickCallback = param5;
         _emblemWidth = param3;
         _emblemHeight = param4;
         _maxInstances = param7;
         _tooltip = new UiTextTooltip(_content,"");
         onClick.add(handleClick);
         onInteractionOut.add(handleInteractionOut);
         onInteractionOver.add(handleInteractionOver);
         if(param6)
         {
            _content.addFilter(new DropShadowFilter(4,0.785,0,0.5,0));
         }
         var _loc9_:Matrix = new Matrix();
         _loc9_.createGradientBox(_emblemWidth,_emblemHeight,3.14159265358979 * 0.4);
         var _loc8_:Shape = new Shape();
         _loc8_.graphics.beginGradientFill("linear",[16777215,16777215,16777215,16777215,16777215,16777215,16777215],[0,0,0.1,0.15,0.25,0.25,0],[0,20,25,80,85,100,105],_loc9_);
         _loc8_.graphics.drawRect(0,0,_emblemWidth,_emblemHeight);
         _loc8_.graphics.endFill();
         _gradient = _loc8_;
         _gradient.cacheAsBitmap = true;
         _gradient.name = "gradient";
         _content.shapeBackground.removeAllChildren();
         _content.icon.removeAllChildren();
         useHandCursor = false;
         refresh();
      }
      
      override public function dispose() : void
      {
         _content = null;
         super.dispose();
      }
      
      public function get content() : SymbolGuildEmblemGeneric
      {
         return _content;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         if(_enableButton)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            handleInteractionOut(null);
            if(_onClickCallback != null)
            {
               _onClickCallback();
            }
         }
      }
      
      private function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(_enableButton)
         {
            _content.x = _buttonModeX;
            _content.y = _buttonModeY;
            _content.scaleX = 1.1;
            _content.scaleY = 1.1;
         }
      }
      
      private function handleInteractionOut(param1:InteractionEvent) : void
      {
         if(_enableButton)
         {
            _content.x = _originalX;
            _content.y = _originalY;
            _content.scaleX = 1;
            _content.scaleY = 1;
         }
      }
      
      public function set enableButton(param1:Boolean) : void
      {
         _enableButton = param1;
         useHandCursor = _enableButton;
      }
      
      public function set tooltip(param1:String) : void
      {
         _tooltip.text = param1;
      }
      
      public function refresh(param1:GuildEmblemSettings = null, param2:Boolean = false) : void
      {
         if(param1 != null || param2)
         {
            _settings = param1;
         }
         if(_settings == null)
         {
            _content.visible = false;
            return;
         }
         _content.visible = true;
         _originalX = _content.x;
         _originalY = _content.y;
         _buttonModeX = _content.x - (_emblemWidth * 1.1 - _emblemWidth) / 2;
         _buttonModeY = _content.y - (_emblemHeight * 1.1 - _emblemHeight) / 2;
         _maskLayer = null;
         _iconLayer = null;
         _content.shapeBackground.setUriSprite(_settings.emblemBackgroundMovieUrl,_emblemWidth,_emblemHeight,false,_maxInstances,onCompletedShapeFlash);
         _content.icon.setUriSprite(_settings.emblemIconMovieUrl,_emblemWidth,_emblemHeight,false,_maxInstances,onCompletedIconFlash);
         _content.icon.removeAllFilters();
         _content.icon.addFilter(new TintFilter(_settings.emblemIconColor));
         _content.icon.getChildAt(0).x = -(_emblemWidth / 2);
         _content.icon.getChildAt(0).y = -(_emblemHeight / 2);
         _content.icon.x = _emblemWidth / 2;
         _content.icon.y = _emblemHeight / 2;
         _content.icon.scaleX = _settings.emblemIconSize / 100;
         _content.icon.scaleY = _settings.emblemIconSize / 100;
      }
      
      private function maskLayer() : void
      {
         if(_maskLayer && _iconLayer && _iconLayer.mask != _maskLayer)
         {
            if(Environment.platform.id != "steam")
            {
               _iconLayer.mask = null;
               _iconLayer.mask = _maskLayer;
            }
         }
      }
      
      private function onCompletedShapeFlash(param1:IUriSprite) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(_settings == null)
         {
            return;
         }
         try
         {
            _loc2_ = (param1.getChildAt(1) as FlashMovieClip)._movieClip;
            _maskLayer = _loc2_.getChildByName("m") as Sprite;
            _maskLayer.visible = false;
            _loc4_ = _loc2_.getChildByName("b") as Sprite;
            _loc8_ = _loc2_.getChildByName("f") as Sprite;
            _loc4_.visible = true;
            _loc8_.visible = true;
            _loc3_ = new ColorTransform();
            _loc3_.color = _settings.emblemBackgroundColor;
            _loc4_.transform.colorTransform = _loc3_;
            _loc3_ = new ColorTransform();
            _loc3_.color = _settings.emblemBackgroundBorderColor;
            _loc8_.transform.colorTransform = _loc3_;
            _loc5_ = duplicateDisplayObject(_loc8_) as MovieClip;
            _loc9_ = new BitmapData(int(_loc8_.width),int(_loc8_.height),true,0);
            _loc9_.draw(_loc8_);
            _loc6_ = new Bitmap(_loc9_);
            _loc5_.addChild(_loc6_);
            _loc5_.name = "frameCopy";
            _loc5_.cacheAsBitmap = true;
            _loc5_.scaleX = _emblemWidth / 192;
            _loc5_.scaleY = _emblemHeight / 192;
            _loc5_.x = _loc5_.x * _loc5_.scaleX;
            _loc5_.y = _loc5_.y * _loc5_.scaleY;
            _loc7_ = FlashDisplayObject.getNativeDisplayObject(_content) as Sprite;
            if(_loc7_.getChildByName("frameCopy") != null)
            {
               _loc7_.removeChild(_loc7_.getChildByName("frameCopy"));
            }
            _loc7_.addChild(_loc5_);
            _gradient.mask = _loc5_;
            if(_loc7_.getChildByName("gradient") == null)
            {
               _loc7_.addChild(_gradient);
            }
            maskLayer();
            return;
         }
         catch(e:Error)
         {
            return;
         }
      }
      
      private function onCompletedIconFlash(param1:IUriSprite) : void
      {
         if(_settings == null)
         {
            return;
         }
         _iconLayer = (param1.getChildAt(1) as FlashMovieClip)._movieClip;
         maskLayer();
      }
      
      private function duplicateDisplayObject(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:Class = Object(param1).constructor;
         var _loc6_:DisplayObject = new _loc5_();
         _loc6_.transform = param1.transform;
         _loc6_.filters = param1.filters;
         _loc6_.cacheAsBitmap = param1.cacheAsBitmap;
         _loc6_.opaqueBackground = param1.opaqueBackground;
         if(param1.scale9Grid)
         {
            _loc2_ = param1.scale9Grid;
            _loc6_.scale9Grid = _loc2_;
         }
         if(param1 is MovieClip)
         {
            _loc3_ = param1 as MovieClip;
            _loc4_ = 0;
            while(_loc4_ < _loc3_.numChildren)
            {
               (_loc6_ as MovieClip).addChild(duplicateDisplayObject(_loc3_.getChildAt(_loc4_)));
               _loc4_++;
            }
         }
         return _loc6_;
      }
   }
}
