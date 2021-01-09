package com.playata.application.ui.elements.generic.button
{
   import com.greensock.easing.Back;
   import com.greensock.easing.Sine;
   import com.playata.application.ui.elements.generic.textfield.UiTextTooltip;
   import com.playata.framework.application.Environment;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.IDisplayObjectContainer;
   import com.playata.framework.display.InteractiveDisplayObjectState;
   import com.playata.framework.display.filter.SaturationFilter;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.Button;
   import com.playata.framework.display.ui.controls.TextTooltip;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftBlueGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowLeftGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightBlueGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   import visuals.ui.elements.buttons.SymbolButtonCloseGeneric;
   import visuals.ui.elements.guild.SymbolGuildButtonArrowDownWhiteGeneric;
   import visuals.ui.elements.guild.SymbolGuildButtonArrowUpWhiteGeneric;
   
   public class UiButton extends Button
   {
      
      public static const INTERACTION_OVER_MODE_NONE:String = "none";
      
      public static const INTERACTION_OVER_MODE_GROW:String = "grow";
      
      public static const INTERACTION_OVER_MODE_GROW_TWEENED:String = "growTweened";
      
      private static var _defaultInteractionOverMode:String = null;
      
      private static var _onClickGlobal:Function = null;
       
      
      protected var _interactionOverMode:String = "growTweened";
      
      protected var _content:IDisplayObject = null;
      
      protected var _originalScaleX:Number = 1;
      
      protected var _originalScaleY:Number = 1;
      
      protected var _tag:Object = null;
      
      public function UiButton(param1:IDisplayObject, param2:String, param3:Function)
      {
         _content = param1;
         _originalScaleX = _content.scaleX;
         _originalScaleY = _content.scaleY;
         super(_content,param3);
         if(Environment.info.isTouchScreen)
         {
            if(_content is SymbolButtonCloseGeneric || _content is SymbolButtonArrowLeftGeneric || _content is SymbolButtonArrowLeftBlueGeneric || _content is SymbolButtonArrowRightGeneric || _content is SymbolButtonArrowRightBlueGeneric || _content is SymbolButtonArrowUpGeneric || _content is SymbolButtonArrowDownGeneric || _content is SymbolGuildButtonArrowDownWhiteGeneric || _content is SymbolGuildButtonArrowUpWhiteGeneric)
            {
               extendClickArea(10,10,-7,-7);
            }
         }
         this.tooltip = param2;
         onClick.add(handleClick);
         onInteractionOver.add(handleInteractionOver);
         onInteractionDown.add(handleInteractionDown);
         onInteractionOut.add(handleInteractionOut);
         onInteractionUp.add(handleInteractionUp);
      }
      
      public static function set onClickGlobal(param1:Function) : void
      {
         _onClickGlobal = param1;
      }
      
      public static function get onClickGlobal() : Function
      {
         return _onClickGlobal;
      }
      
      public static function set defaultInteractionOverMode(param1:String) : void
      {
         _defaultInteractionOverMode = param1;
      }
      
      public static function get defaultInteractionOverMode() : String
      {
         return _defaultInteractionOverMode;
      }
      
      public function extendClickArea(param1:Number, param2:Number, param3:Number = 0, param4:Number = 0) : void
      {
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc8_:int = 0;
         var _loc6_:* = NaN;
         var _loc7_:* = NaN;
         if(_content is IDisplayObjectContainer)
         {
            _loc5_ = _content as IDisplayObjectContainer;
            _loc9_ = null;
            _loc8_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < _loc5_.numChildren)
            {
               _loc9_ = _loc5_.getChildAt(_loc8_);
               if(_loc9_)
               {
                  if(_loc9_.x < _loc6_)
                  {
                     _loc6_ = Number(_loc9_.x);
                  }
                  if(_loc9_.y < _loc7_)
                  {
                     _loc7_ = Number(_loc9_.y);
                  }
               }
               _loc8_++;
            }
            _loc5_.addChildAt(DisplayObjectFactory.createQuadFromSettings({
               "x":_loc6_ - param1 / 2 + param3,
               "y":_loc7_ - param2 / 2 + param4,
               "width":_content.width + param1,
               "height":_content.height + param2,
               "touchable":true,
               "alpha":0,
               "color":16711680
            }),0);
         }
      }
      
      protected function handleInteractionOver(param1:InteractionEvent) : void
      {
         if(enabled)
         {
            var _loc2_:* = interactionOverMode;
            switch(_loc2_)
            {
               case "none":
                  break;
               case "grow":
                  scaleX = 1.1 * _originalScaleX;
                  scaleY = 1.1 * _originalScaleY;
                  break;
               case "growTweened":
                  _content.tweenTo(0.3,{
                     "scaleX":_originalScaleX * 1.1,
                     "scaleY":_originalScaleY * 1.1,
                     "ease":Back.easeOut
                  });
                  break;
               default:
                  throw new Error("Unsupported mouse over mode! mode=" + interactionOverMode);
            }
         }
      }
      
      protected function handleInteractionDown(param1:InteractionEvent) : void
      {
      }
      
      protected function handleInteractionOut(param1:InteractionEvent) : void
      {
      }
      
      protected function handleInteractionUp(param1:InteractionEvent) : void
      {
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         if(_enabled != param1)
         {
            if(!param1)
            {
               addFilter(new SaturationFilter(-0.5));
            }
            else
            {
               removeAllFilters();
            }
         }
         .super.enabled = param1;
      }
      
      override protected function onStateChanged(param1:InteractiveDisplayObjectState) : void
      {
         if(enabled == false)
         {
            _content.scaleX = _originalScaleX;
            _content.scaleY = _originalScaleY;
         }
         var _loc2_:* = param1;
         if(InteractiveDisplayObjectState.UP === _loc2_)
         {
            if(enabled)
            {
               _loc2_ = interactionOverMode;
               switch(_loc2_)
               {
                  case "none":
                     break;
                  case "grow":
                     scaleX = _originalScaleX;
                     scaleY = _originalScaleY;
                     break;
                  case "growTweened":
                     _content.tweenTo(0.5,{
                        "scaleX":_originalScaleX,
                        "scaleY":_originalScaleY,
                        "ease":Sine.easeIn
                     });
                     break;
                  default:
                     throw new Error("Unsupported mouse over mode! mode=" + interactionOverMode);
               }
            }
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
         _content = null;
      }
      
      public function set clickCallback(param1:Function) : void
      {
         onClick.removeAll();
         onClick.add(param1);
         onClick.add(handleClick);
      }
      
      protected function handleClick(param1:InteractionEvent) : void
      {
         if(_enabled)
         {
            Environment.audio.playFX("ui_button_click.mp3");
            if(Environment.info.isTouchScreen)
            {
               TooltipLayer.instance.tooltipVisible = false;
            }
            if(_onClickGlobal != null)
            {
               _onClickGlobal(param1);
            }
         }
         else
         {
            Environment.audio.playFX("ui_button_click_disabled.mp3");
         }
      }
      
      public function set tooltip(param1:String) : void
      {
         if(param1 && (!_tooltip || !(_tooltip is TextTooltip)))
         {
            assignTooltip(new UiTextTooltip(this,param1));
         }
         if(_tooltip is TextTooltip)
         {
            (_tooltip as TextTooltip).text = param1;
         }
      }
      
      public function set htmlTooltip(param1:String) : void
      {
         if(param1 && (!_tooltip || !(_tooltip is TextTooltip)))
         {
            assignTooltip(new UiTextTooltip(this,param1));
         }
         if(_tooltip is TextTooltip)
         {
            (_tooltip as TextTooltip).htmlText = param1;
         }
      }
      
      public function get tooltip() : String
      {
         if(_tooltip is TextTooltip)
         {
            return (_tooltip as TextTooltip).text;
         }
         return null;
      }
      
      public function get textTooltip() : TextTooltip
      {
         if(!_tooltip || !(_tooltip is TextTooltip))
         {
            assignTooltip(new UiTextTooltip(this,""));
         }
         return _tooltip as TextTooltip;
      }
      
      public function set interactionOverMode(param1:String) : void
      {
         _interactionOverMode = param1;
      }
      
      public function get interactionOverMode() : String
      {
         if(_interactionOverMode == "none")
         {
            return _interactionOverMode;
         }
         return _defaultInteractionOverMode != null?_defaultInteractionOverMode:_interactionOverMode;
      }
      
      public function get content() : IDisplayObject
      {
         return _content;
      }
      
      public function get buttonEnabled() : Boolean
      {
         return _enabled;
      }
      
      public function set buttonEnabled(param1:Boolean) : void
      {
         enabled = param1;
      }
      
      public function get tag() : Object
      {
         return _tag;
      }
      
      public function get tagAsInt() : int
      {
         return _tag as int;
      }
      
      public function get tagAsString() : String
      {
         return _tag as String;
      }
      
      public function set tag(param1:Object) : void
      {
         _tag = param1;
      }
   }
}
