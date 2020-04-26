package com.playata.framework.display.lib.flash
{
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IInteractiveDisplayObject;
   import com.playata.framework.display.IQuad;
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.ui.controls.RichElementInfo;
   import com.playata.framework.input.InteractionEvent;
   import flash.geom.Rectangle;
   import flash.text.TextLineMetrics;
   
   public class FlashRichTextOverlay extends Sprite
   {
       
      
      private var _richTextField:FlashRichTextField;
      
      protected var _elementMap:Array;
      
      var _elementContainer:Sprite;
      
      var _overlayMask:IQuad;
      
      public function FlashRichTextOverlay(param1:FlashRichTextField)
      {
         super();
         _richTextField = param1;
         _elementMap = [];
         _overlayMask = DisplayObjectFactory.createQuadFromSettings({
            "width":_richTextField.width,
            "height":_richTextField.height
         });
         this.addChild(_overlayMask);
         _elementContainer = new Sprite();
         _elementContainer.mask = _overlayMask;
         this.addChild(_elementContainer);
      }
      
      public function addElement(param1:RichElementInfo) : void
      {
         elementInfo = param1;
         if(_richTextField._onElementUp != null)
         {
            elementInfo.visual.onInteractionUp.add(function(param1:InteractionEvent):void
            {
               _richTextField._onElementUp.dispatch(elementInfo.code,elementInfo.tag);
            });
         }
         if(_richTextField._onElementDown != null)
         {
            elementInfo.visual.onInteractionDown.add(function(param1:InteractionEvent):void
            {
               _richTextField._onElementDown.dispatch(elementInfo.code,elementInfo.tag);
            });
         }
         if(_richTextField._onElementMove != null)
         {
            elementInfo.visual.onInteractionMove.add(function(param1:InteractionEvent):void
            {
               _richTextField._onElementMove.dispatch(elementInfo.code,elementInfo.tag);
            });
         }
         if(_richTextField._onElementOut != null)
         {
            elementInfo.visual.onInteractionOut.add(function(param1:InteractionEvent):void
            {
               _richTextField._onElementOut.dispatch(elementInfo.code,elementInfo.tag);
            });
         }
         if(_richTextField._onElementOver != null)
         {
            elementInfo.visual.onInteractionOver.add(function(param1:InteractionEvent):void
            {
               _richTextField._onElementOver.dispatch(elementInfo.code,elementInfo.tag);
            });
         }
         if(_richTextField._onElementClick != null)
         {
            elementInfo.visual.onClick.add(function(param1:InteractionEvent):void
            {
               _richTextField._onElementClick.dispatch(elementInfo.code,elementInfo.tag);
            });
         }
         if(_richTextField._onElementDoubleClick != null)
         {
            elementInfo.visual.onDoubleClick.add(function(param1:InteractionEvent):void
            {
               _richTextField._onElementDoubleClick.dispatch(elementInfo.code,elementInfo.tag);
            });
         }
         _elementMap.push(elementInfo);
         _elementContainer.addChild(elementInfo.visual);
      }
      
      public function clear() : void
      {
         _elementMap = [];
         _elementContainer.removeAllChildren();
      }
      
      public function refresh() : void
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:int = _elementMap.length;
         if(_loc4_ <= 0)
         {
            return;
         }
         while(true)
         {
            _loc4_--;
            if(_loc4_ <= 0)
            {
               break;
            }
            _loc6_ = _elementMap[_loc4_] as RichElementInfo;
            if(_loc6_)
            {
               _loc3_ = _loc6_.visual;
               if(_loc3_)
               {
                  _loc1_ = _richTextField._textField.getCharBoundaries(_loc6_.index);
                  if(_loc1_)
                  {
                     _loc2_ = _richTextField._textField.getLineMetrics(_richTextField._textField.getLineIndexOfChar(_loc6_.index));
                     _loc5_ = _loc1_.height * 0.5 > _loc3_.height?Math.round(_loc2_.ascent - _loc3_.height):Number(Math.round((_loc1_.height - _loc3_.height) * 0.5));
                     _loc3_.visible = true;
                     _loc3_.x = Math.round(_loc1_.x + (_loc1_.width - _loc3_.width) * 0.5 - _richTextField._textField.scrollH);
                     _loc3_.y = Math.round(_loc1_.y + _loc5_);
                  }
                  else
                  {
                     _loc3_.visible = false;
                  }
               }
            }
         }
      }
   }
}
