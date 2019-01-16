package com.playata.application.ui.elements.application
{
   import com.playata.framework.application.Environment;
   import visuals.ui.base.SymbolCurtainGeneric;
   
   public class Curtain
   {
       
      
      private var _content:SymbolCurtainGeneric = null;
      
      private var _maintenanceInfo:UiLoadingScreen = null;
      
      private var _onClosed:Function = null;
      
      public function Curtain(param1:SymbolCurtainGeneric)
      {
         super();
         _content = param1;
         _content.blocker.visible = false;
      }
      
      public function get isOpen() : Boolean
      {
         return _content.background.alpha === 0;
      }
      
      public function get content() : SymbolCurtainGeneric
      {
         return _content;
      }
      
      public function open() : void
      {
         if(_maintenanceInfo)
         {
            _maintenanceInfo.hide();
            _maintenanceInfo = null;
         }
         Environment.display.displayContext.nativeStage.color = 0;
         _content.blocker.visible = true;
         if(!isOpen)
         {
            _content.background.tweenFromTo(1,{"alpha":1},{
               "alpha":0,
               "onComplete":onOpenComplete
            });
         }
      }
      
      public function close(param1:Function) : void
      {
         _onClosed = param1;
         _content.blocker.visible = true;
         if(isOpen)
         {
            _content.background.tweenFromTo(1,{"alpha":0},{
               "alpha":1,
               "onComplete":onCloseComplete
            });
         }
      }
      
      private function onOpenComplete() : void
      {
         _content.blocker.visible = false;
      }
      
      private function onCloseComplete() : void
      {
         if(!_maintenanceInfo)
         {
            _maintenanceInfo = new UiLoadingScreen(true,"");
         }
         _maintenanceInfo.show(null,true);
         _content.blocker.visible = false;
         if(_onClosed != null)
         {
            _onClosed();
         }
      }
   }
}
