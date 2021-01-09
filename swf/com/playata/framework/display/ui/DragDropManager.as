package com.playata.framework.display.ui
{
   import com.playata.framework.core.Core;
   import com.playata.framework.core.collection.GenericMap;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObject;
   import com.playata.framework.input.InputCore;
   import com.playata.framework.input.InteractionEvent;
   import flash.display.InteractiveObject;
   import flash.geom.Point;
   
   public class DragDropManager
   {
       
      
      private var _currentDragSource:IDragSource = null;
      
      private var _originX:int = 0;
      
      private var _originY:int = 0;
      
      private var _isPressed:Boolean = false;
      
      private var _isDragged:Boolean = false;
      
      private var _originParent:IDisplayObjectContainer = null;
      
      private var _oldMouseX:int = 0;
      
      private var _oldMouseY:int = 0;
      
      private var _currentActiveDropTargets:GenericMap;
      
      private var _dragLayer:com.playata.framework.display.Sprite = null;
      
      private var _dialogDragLayer:com.playata.framework.display.Sprite = null;
      
      private var _dropTargets:Vector.<IDropTarget>;
      
      public function DragDropManager()
      {
         _currentActiveDropTargets = new GenericMap();
         _dropTargets = new Vector.<IDropTarget>();
         super();
      }
      
      public function startDrag(param1:IDragSource, param2:int = 0, param3:int = 0) : void
      {
         if(_isPressed == true)
         {
            return;
         }
         _currentDragSource = param1;
         _currentActiveDropTargets = new GenericMap();
         _originX = _currentDragSource.x;
         _originY = _currentDragSource.y;
         _originParent = _currentDragSource.parent;
         _currentDragSource.x = _currentDragSource.globalX + param2;
         _currentDragSource.y = _currentDragSource.globalY + param3;
         if(dialogDragLayer)
         {
            dialogDragLayer.addChild(_currentDragSource);
         }
         else
         {
            dragLayer.addChild(_currentDragSource);
         }
         TooltipLayer.instance.showTooltips = false;
         _isPressed = true;
         _isDragged = false;
         _oldMouseX = InputCore.current.mouse.mouseX;
         _oldMouseY = InputCore.current.mouse.mouseY;
         InputCore.current.mouse.onMove.add(handleInteractionMove);
      }
      
      public function endDrag(param1:IDragSource) : void
      {
         if(_isPressed == false)
         {
            return;
         }
         var _loc4_:* = !_isDragged;
         _originParent.addChild(_currentDragSource);
         _currentDragSource.x = 9999;
         _currentDragSource.y = 9999;
         TooltipLayer.instance.showTooltips = true;
         var _loc2_:* = null;
         var _loc3_:Point = new Point(InputCore.current.mouse.mouseX,InputCore.current.mouse.mouseY);
         var _loc6_:Point = new Point();
         if(!_loc4_)
         {
            var _loc8_:int = 0;
            var _loc7_:* = dropTargets;
            for each(var _loc5_ in dropTargets)
            {
               if(_loc5_.acceptsDragSource(_currentDragSource))
               {
                  _loc5_.globalToLocal(_loc3_,_loc6_);
                  if(_loc5_.getBounds(_loc5_).containsPoint(_loc6_))
                  {
                     _loc2_ = _loc5_;
                     break;
                  }
               }
            }
         }
         if(_loc2_)
         {
            if(_loc2_.onDrop(_currentDragSource))
            {
               _currentDragSource.onDragComplete(_loc2_);
            }
            else
            {
               _currentDragSource.onDragComplete(null);
               _currentDragSource.x = _originX;
               _currentDragSource.y = _originY;
            }
         }
         else
         {
            _currentDragSource.onDragComplete(null);
            _currentDragSource.x = _originX;
            _currentDragSource.y = _originY;
         }
         _isPressed = false;
         _isDragged = false;
         _currentDragSource = null;
         _currentActiveDropTargets = new GenericMap();
         InputCore.current.mouse.onMove.remove(handleInteractionMove);
      }
      
      private function handleInteractionMove(param1:InteractionEvent) : void
      {
         var _loc2_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc7_:int = 0;
         var _loc6_:int = 0;
         var _loc3_:* = null;
         var _loc8_:* = null;
         if(_isPressed && _currentDragSource)
         {
            _loc2_ = InputCore.current.mouse.mouseX;
            _loc4_ = InputCore.current.mouse.mouseY;
            if(!_isDragged && Core.current.info.isTouchScreen)
            {
               if(Math.abs(_oldMouseX - _loc2_) < 5 && Math.abs(_oldMouseY - _loc4_) < 5)
               {
                  return;
               }
            }
            if(!_isDragged)
            {
               _currentDragSource.onDragStart();
            }
            _isDragged = true;
            _loc7_ = _loc2_;
            _loc6_ = _loc4_;
            _currentDragSource.x = _currentDragSource.x + (_loc7_ - _oldMouseX);
            _currentDragSource.y = _currentDragSource.y + (_loc6_ - _oldMouseY);
            _oldMouseX = _loc2_;
            _oldMouseY = _loc4_;
            _loc3_ = new Point(_loc2_,_loc4_);
            _loc8_ = new Point();
            var _loc10_:int = 0;
            var _loc9_:* = dropTargets;
            for each(var _loc5_ in dropTargets)
            {
               if(_loc5_.acceptsDragSource(_currentDragSource))
               {
                  _loc5_.globalToLocal(_loc3_,_loc8_);
                  if(_loc5_.getBounds(_loc5_).containsPoint(_loc8_))
                  {
                     if(!§§pop())
                     {
                        _loc5_.onDragIn(_currentDragSource);
                     }
                     _currentActiveDropTargets.setData(_loc5_,true);
                  }
                  else if(_currentActiveDropTargets.getData(_loc5_) === true)
                  {
                     _loc5_.onDragOut(_currentDragSource);
                     _currentActiveDropTargets.setData(_loc5_,false);
                  }
               }
            }
         }
      }
      
      public function get currentDragSource() : IDragSource
      {
         return _currentDragSource;
      }
      
      public function set dragLayer(param1:com.playata.framework.display.Sprite) : void
      {
         _dragLayer = param1;
         if(_dragLayer)
         {
            (FlashDisplayObject.getNativeDisplayObject(_dragLayer) as InteractiveObject).mouseEnabled = false;
            (FlashDisplayObject.getNativeDisplayObject(_dragLayer) as flash.display.Sprite).mouseChildren = false;
            _dragLayer.removeAllChildren();
            _dragLayer.bringToTop();
         }
      }
      
      public function get dragLayer() : com.playata.framework.display.Sprite
      {
         return _dragLayer;
      }
      
      public function set dialogDragLayer(param1:com.playata.framework.display.Sprite) : void
      {
         _dialogDragLayer = param1;
         if(_dialogDragLayer)
         {
            (FlashDisplayObject.getNativeDisplayObject(_dialogDragLayer) as InteractiveObject).mouseEnabled = false;
            (FlashDisplayObject.getNativeDisplayObject(_dialogDragLayer) as flash.display.Sprite).mouseChildren = false;
            _dialogDragLayer.removeAllChildren();
            _dialogDragLayer.bringToTop();
         }
      }
      
      public function get dialogDragLayer() : com.playata.framework.display.Sprite
      {
         return _dialogDragLayer;
      }
      
      public function get dropTargets() : Vector.<IDropTarget>
      {
         return _dropTargets;
      }
      
      public function addDropTarget(param1:IDropTarget) : void
      {
         _dropTargets.push(param1);
      }
      
      public function clearDropTargets() : void
      {
         _dropTargets = new Vector.<IDropTarget>();
      }
      
      public function get isDragged() : Boolean
      {
         return _isDragged;
      }
   }
}
