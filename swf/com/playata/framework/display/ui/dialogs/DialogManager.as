package com.playata.framework.display.ui.dialogs
{
   import com.playata.framework.core.IDisposable;
   import com.playata.framework.core.Runtime;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.DisplayCore;
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.display.ui.Align;
   import com.playata.framework.tween.TweenEaseType;
   import com.playata.framework.tween.TweenVars;
   
   public class DialogManager implements IDisposable
   {
      
      private static var TWEEN_SHOW:TweenVars = new TweenVars(new TypedObject({"alpha":0.7}));
      
      private static var TWEEN_HIDE:TweenVars = new TweenVars(new TypedObject({"alpha":0}));
       
      
      private var _dialogLayer:IDisplayObjectContainer;
      
      private var _darkener:IInteractiveDisplayObject;
      
      private var _lastDialogClassName:String = null;
      
      private var _pendingDialogs:Vector.<Dialog>;
      
      private var _visibleDialogs:Vector.<Dialog>;
      
      private var _centerX:int;
      
      private var _centerY:int;
      
      private var _closeAllDialogs:Boolean = false;
      
      public function DialogManager()
      {
         super();
      }
      
      public function dispose() : void
      {
      }
      
      public function get lastDialogClassName() : String
      {
         return _lastDialogClassName;
      }
      
      public function init(param1:IDisplayObjectContainer, param2:IDisplayObject) : void
      {
         _pendingDialogs = new Vector.<Dialog>(0);
         _visibleDialogs = new Vector.<Dialog>(0);
         _dialogLayer = DisplayObjectFactory.createSpriteFromSettings();
         param1.addChild(_dialogLayer);
         _dialogLayer.align(Align.TOP,Align.LEFT);
         _darkener = new InteractiveDisplayObject(param2);
         _darkener.alpha = 0;
         _darkener.interactionEnabled = true;
         _dialogLayer.addChild(_darkener);
         refreshAppSize();
         _dialogLayer.visible = false;
      }
      
      public function refreshAppSize() : void
      {
         _centerX = DisplayCoreConfig.layout.appWidth >> 1;
         _centerY = DisplayCoreConfig.layout.appHeight >> 1;
         _darkener.width = DisplayCoreConfig.layout.appWidth;
         _darkener.height = DisplayCoreConfig.layout.appHeight;
      }
      
      public function hasVisibleDialog(param1:Class = null) : Boolean
      {
         if(!param1)
         {
            return _visibleDialogs.length > 0;
         }
         if(_visibleDialogs.length == 0)
         {
            return false;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _visibleDialogs;
         for each(var _loc2_ in _visibleDialogs)
         {
            if(_loc2_ is param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function getVisibleDialog(param1:Class) : Dialog
      {
         if(_visibleDialogs.length == 0)
         {
            return null;
         }
         var _loc4_:int = 0;
         var _loc3_:* = _visibleDialogs;
         for each(var _loc2_ in _visibleDialogs)
         {
            if(_loc2_ is param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function closeLastDialog() : void
      {
         if(_visibleDialogs.length == 0)
         {
            return;
         }
         _visibleDialogs[_visibleDialogs.length - 1].close();
      }
      
      public function resetCloseAllDialogs() : void
      {
         _closeAllDialogs = false;
      }
      
      public function closeAllDialogs() : void
      {
         _closeAllDialogs = true;
         _pendingDialogs.length = 0;
         if(_visibleDialogs.length > 0)
         {
            _visibleDialogs[0].close();
         }
         else
         {
            _closeAllDialogs = false;
         }
      }
      
      public function showDialog(param1:Dialog) : void
      {
         if(param1.isQueued && _visibleDialogs.length > 0)
         {
            _pendingDialogs.push(param1);
         }
         else
         {
            displayDialog(param1);
         }
      }
      
      private function showNextPendingDialog() : void
      {
         var _loc1_:Dialog = _pendingDialogs.shift();
         displayDialog(_loc1_);
      }
      
      private function displayDialog(param1:Dialog) : void
      {
         _lastDialogClassName = Runtime.getClassName(param1,false);
         show();
         _visibleDialogs.push(param1);
         DisplayCore.panelManager.focusManager.focusContainer = param1;
         _dialogLayer.addChild(_darkener);
         _dialogLayer.addChild(param1);
         param1.x = _centerX;
         param1.y = _centerY;
         param1.hiding.addOnce(onDialogHiding);
         param1.hidden.addOnce(onDialogHidden);
         param1.onShow();
      }
      
      private function onDialogHiding(param1:Dialog) : void
      {
         _visibleDialogs.removeAt(_visibleDialogs.indexOf(param1));
         if(_visibleDialogs.length > 0)
         {
            return;
         }
         if(_pendingDialogs.length == 0)
         {
            hide();
         }
      }
      
      private function onDialogHidden(param1:Dialog) : void
      {
         dialog = param1;
         _dialogLayer.removeChild(dialog);
         Runtime.delayFunction(function():void
         {
            dialog.dispose();
         },0.5);
         DisplayCore.panelManager.focusManager.resetFocusContainer();
         if(_visibleDialogs.length > 0)
         {
            _dialogLayer.addChildAt(_darkener,_visibleDialogs.length - 1);
         }
         else if(_pendingDialogs.length > 0)
         {
            showNextPendingDialog();
         }
         if(_closeAllDialogs)
         {
            if(_visibleDialogs.length > 0)
            {
               _visibleDialogs[0].close();
            }
            else
            {
               _closeAllDialogs = false;
            }
         }
      }
      
      private function show() : void
      {
         if(_visibleDialogs.length > 0)
         {
            return;
         }
         _darkener.killTweens();
         _dialogLayer.visible = true;
         TWEEN_SHOW.easeType = TweenEaseType.Linear;
         _darkener.tweenTo(0.2,TWEEN_SHOW);
      }
      
      private function hide() : void
      {
         onDarkenerHidden = function():void
         {
            if(_visibleDialogs.length == 0)
            {
               _dialogLayer.visible = false;
            }
         };
         TWEEN_HIDE.easeType = TweenEaseType.Linear;
         TWEEN_HIDE.onComplete.removeAll();
         TWEEN_HIDE.onComplete.addOnce(onDarkenerHidden);
         _darkener.tweenTo(0.2,TWEEN_HIDE);
      }
   }
}
