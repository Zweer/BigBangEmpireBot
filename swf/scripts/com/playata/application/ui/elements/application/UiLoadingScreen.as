package com.playata.application.ui.elements.application
{
   import com.playata.application.AppLayout;
   import com.playata.framework.application.Environment;
   import com.playata.framework.core.Core;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.tween.Tween;
   import flash.display.DisplayObjectContainer;
   
   public class UiLoadingScreen
   {
      
      public static var _customLogoId:String = null;
       
      
      private var _content:SymbolPreloader = null;
      
      public function UiLoadingScreen(param1:Boolean, param2:String)
      {
         super();
         _content = new SymbolPreloader();
         _content.completionText.text = "";
         _content.completionText.visible = false;
         _content.progressBarFill.visible = false;
         _content.progressBarBackground.visible = false;
         if(param2)
         {
            _content.textStatus.text = param2;
            _content.textStatus.antiAliasType = "advanced";
         }
         else
         {
            _content.textStatus.visible = false;
         }
         _content.logo.visible = false;
         _content.logo.stop();
         refreshLayout();
      }
      
      public function get customLogoId() : String
      {
         if(_customLogoId)
         {
            return _customLogoId;
         }
         if(Core.config == null || !Core.config.hasCfg("urlLogo"))
         {
            return null;
         }
         return Core.config.getString("urlLogo");
      }
      
      public function get hasCustomLogo() : Boolean
      {
         return customLogoId != null && customLogoId != "" && customLogoId != "bbe";
      }
      
      public function get content() : SymbolPreloader
      {
         return _content;
      }
      
      public function set progress(param1:Number) : void
      {
         if(param1 == 0)
         {
            _content.completionText.visible = false;
            return;
         }
         _content.completionText.visible = true;
         _content.completionText.text = Math.floor(param1).toString() + "%";
         if(!hasCustomLogo)
         {
            _content.logo.m.scaleX = 1 - param1 / 100;
         }
      }
      
      public function set progressBarValue(param1:Number) : void
      {
         if(param1 >= 1)
         {
            _content.progressBarFill.visible = false;
            _content.progressBarBackground.visible = false;
            return;
         }
         _content.progressBarFill.visible = true;
         _content.progressBarBackground.visible = true;
         _content.progressBarFill.width = (_content.progressBarBackground.width - 2) * param1;
      }
      
      public function set statusMessage(param1:String) : void
      {
         _content.textStatus.visible = true;
         _content.textStatus.text = param1;
         if(!hasCustomLogo)
         {
            _content.logo.m.scaleX = 0;
         }
      }
      
      public function set showLoadingCircle(param1:Boolean) : void
      {
      }
      
      public function refreshLayout() : void
      {
         var _loc1_:uint = DisplayCoreConfig.layout.appWidth;
         var _loc2_:uint = DisplayCoreConfig.layout.appHeight + AppLayout.friendbarCorrection;
         _content.mainBackground.width = _loc1_;
         _content.mainBackground.height = _loc2_;
         _content.innerBackground.width = _loc1_;
         _content.innerBackground.height = _loc2_;
         _content.borderTop.width = _loc1_;
         _content.borderBottom.width = _loc1_;
         _content.borderLeft.height = _loc2_;
         _content.borderRight.height = _loc2_;
         _content.borderRight.x = _loc1_ - _content.borderRight.width;
         _content.borderBottom.y = _loc2_ - _content.borderBottom.height;
         _content.background.imageRight.x = _loc1_ - _content.background.imageRight.width;
         var _loc3_:Number = LayoutUtil.deviceAdjustedWidthCorrection / 2;
         _content.logo.x = _content.logo.x + _loc3_;
         _content.textStatus.x = _content.textStatus.x + _loc3_;
         _content.completionText.x = _content.completionText.x + _loc3_;
         _content.progressBarBackground.x = _content.progressBarBackground.x + _loc3_;
         _content.progressBarFill.x = _content.progressBarFill.x + _loc3_;
         _content.logo.visible = true;
         if(hasCustomLogo)
         {
            _content.logo.gotoAndStop(customLogoId);
         }
      }
      
      public function fadeOut(param1:Function) : void
      {
         Tween.to(_content,2,{
            "autoAlpha":0,
            "onComplete":param1
         });
      }
      
      public function show(param1:DisplayObjectContainer = null, param2:Boolean = false) : void
      {
         _content.visible = true;
         if(_content.textStatus.visible && !hasCustomLogo)
         {
            _content.logo.m.scaleX = 0;
         }
         if(param2)
         {
            refreshLayout();
         }
         if(param1)
         {
            param1.addChild(_content);
         }
         else
         {
            Environment.display.displayContext.nativeStage.addChild(_content);
         }
      }
      
      public function hide(param1:DisplayObjectContainer = null) : void
      {
         if(param1)
         {
            param1.removeChild(_content);
         }
         else
         {
            Environment.display.displayContext.nativeStage.removeChild(_content);
         }
      }
   }
}
