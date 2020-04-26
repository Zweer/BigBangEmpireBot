package com.playata.application.ui.elements.fullscreen
{
   import com.playata.application.ui.elements.generic.button.UiButton;
   import com.playata.application.ui.elements.generic.dialog.UiTwoChoiceDialog;
   import com.playata.framework.application.Environment;
   import com.playata.framework.data.LocalDataObject;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.layout.LayoutUtil;
   import com.playata.framework.input.InteractionEvent;
   import com.playata.framework.localization.LocText;
   import flash.display.Stage;
   import flash.events.FullScreenEvent;
   import flash.geom.Rectangle;
   import visuals.ui.elements.generic.SymbolFullscreenBackgroundGeneric;
   
   public class UiFullscreenBackground
   {
      
      private static var _fullscreenInformation:LocalDataObject = null;
       
      
      private var _fullscreenBackground:SymbolFullscreenBackgroundGeneric = null;
      
      private var _btnClose:UiButton = null;
      
      private var _topQuad:InteractiveDisplayObject = null;
      
      private var _bottomQuad:InteractiveDisplayObject = null;
      
      private var _leftQuad:InteractiveDisplayObject = null;
      
      private var _rightQuad:InteractiveDisplayObject = null;
      
      private var _backgroundWidth:Number = 0;
      
      private var _backgroundHeight:Number = 0;
      
      public function UiFullscreenBackground(param1:SymbolFullscreenBackgroundGeneric)
      {
         var _loc2_:* = null;
         super();
         _fullscreenBackground = param1;
         _fullscreenBackground.visible = Environment.info.isFullscreenAllowed;
         if(_fullscreenBackground.visible)
         {
            _backgroundWidth = _fullscreenBackground.width;
            _backgroundHeight = _fullscreenBackground.height;
            Environment.display.displayContext.nativeStage.color = 3411234;
            Environment.display.displayContext.nativeStage.scaleMode = "noScale";
            _fullscreenInformation = new LocalDataObject("fullscreen");
            _loc2_ = Environment.display.displayContext.nativeStage;
            _fullscreenBackground.x = -(_backgroundWidth - LayoutUtil.nativeWidth) / 2;
            _fullscreenBackground.y = -(_backgroundHeight - LayoutUtil.nativeHeight) / 2;
            _btnClose = new UiButton(_fullscreenBackground.btnClose,"",onClickClose);
            _btnClose.x = _loc2_.fullScreenWidth + (_backgroundWidth - _loc2_.fullScreenWidth) / 2 - 60;
            _btnClose.y = (_backgroundHeight - _loc2_.fullScreenHeight) / 2 + 40;
            _btnClose.visible = isFullscreen();
            _topQuad = new InteractiveDisplayObject(DisplayObjectFactory.createQuadFromSettings({
               "width":4000,
               "height":4000,
               "color":3411234
            }));
            _bottomQuad = new InteractiveDisplayObject(DisplayObjectFactory.createQuadFromSettings({
               "width":4000,
               "height":4000,
               "color":3411234
            }));
            _leftQuad = new InteractiveDisplayObject(DisplayObjectFactory.createQuadFromSettings({
               "width":4000,
               "height":4000,
               "color":3411234
            }));
            _rightQuad = new InteractiveDisplayObject(DisplayObjectFactory.createQuadFromSettings({
               "width":4000,
               "height":4000,
               "color":3411234
            }));
            _fullscreenBackground.addChildAt(_topQuad,0);
            _fullscreenBackground.addChildAt(_bottomQuad,0);
            _fullscreenBackground.addChildAt(_leftQuad,0);
            _fullscreenBackground.addChildAt(_rightQuad,0);
            positionBackgroundQuads();
            if(isFullscreen())
            {
               Environment.display.displayContext.nativeStage.displayState = "fullScreenInteractive";
            }
            else if(!_fullscreenInformation.hasData("windowX"))
            {
            }
            _loc2_.addEventListener("fullScreen",onFullScreen);
         }
      }
      
      public static function isFullscreen() : Boolean
      {
         return _fullscreenInformation != null && _fullscreenInformation.hasData("isFullscreen") && _fullscreenInformation.getBoolean("isFullscreen");
      }
      
      private function onFullScreen(param1:FullScreenEvent) : void
      {
         Environment.display.displayContext.nativeStage.scaleMode = "noScale";
         _fullscreenInformation.setBoolean("isFullscreen",param1.fullScreen);
         _fullscreenInformation.save();
         _btnClose.visible = param1.fullScreen;
      }
      
      private function checkScaleMode(param1:Rectangle) : void
      {
         if(param1.width < 1136 || param1.height < 794)
         {
            Environment.display.displayContext.nativeStage.scaleMode = "showAll";
         }
         else
         {
            Environment.display.displayContext.nativeStage.scaleMode = "noScale";
         }
      }
      
      private function positionBackgroundQuads() : void
      {
         var _loc2_:int = _backgroundWidth - LayoutUtil.nativeWidth;
         var _loc1_:int = _backgroundHeight - LayoutUtil.nativeHeight;
         _topQuad.x = (_backgroundWidth - _topQuad.width) / 2;
         _topQuad.y = -_topQuad.height + _loc1_ / 2;
         _bottomQuad.x = (_backgroundWidth - _topQuad.width) / 2;
         _bottomQuad.y = _backgroundHeight - _loc1_ / 2;
         _leftQuad.x = -_leftQuad.width + _loc2_ / 2;
         _leftQuad.y = 0;
         _rightQuad.x = _backgroundWidth - _loc2_ / 2;
         _rightQuad.y = 0;
      }
      
      private function onClickClose(param1:InteractionEvent) : void
      {
         Environment.panelManager.showDialog(new UiTwoChoiceDialog(LocText.current.text("generic/close_application/title"),LocText.current.text("generic/close_application/text"),LocText.current.text("general/button_yes"),LocText.current.text("general/button_no"),onCloseApplication));
      }
      
      private function onCloseApplication() : void
      {
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(_btnClose)
         {
            _btnClose.dispose();
            _btnClose = null;
            _topQuad.dispose();
            _topQuad = null;
            _bottomQuad.dispose();
            _bottomQuad = null;
            _leftQuad.dispose();
            _leftQuad = null;
            _rightQuad.dispose();
            _rightQuad = null;
            _loc1_ = Environment.display.displayContext.nativeStage;
            _loc1_.removeEventListener("fullScreen",onFullScreen);
            _fullscreenInformation = null;
         }
         _fullscreenBackground = null;
      }
   }
}
