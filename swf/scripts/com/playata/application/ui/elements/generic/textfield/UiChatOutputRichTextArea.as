package com.playata.application.ui.elements.generic.textfield
{
   import com.playata.application.data.guild.GuildChatEmoticon;
   import com.playata.application.data.item.LinkedBooster;
   import com.playata.application.data.item.LinkedGuildBooster;
   import com.playata.application.data.item.LinkedItem;
   import com.playata.application.data.user.User;
   import com.playata.application.ui.elements.item.UiLinkedItemTooltip;
   import com.playata.framework.core.TypedObject;
   import com.playata.framework.display.DisplayObjectFactory;
   import com.playata.framework.display.IDisplayObject;
   import com.playata.framework.display.UriSprite;
   import com.playata.framework.display.lib.flash.FlashRichTextField;
   import com.playata.framework.display.ui.Direction;
   import com.playata.framework.display.ui.TooltipLayer;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import com.playata.framework.display.ui.controls.IRichLabelArea;
   
   public class UiChatOutputRichTextArea extends UiChatOutputBase
   {
       
      
      private var _iconTooltip:UiTextTooltip = null;
      
      private var _itemTooltip:UiLinkedItemTooltip = null;
      
      private var _richTextArea:IRichLabelArea = null;
      
      public function UiChatOutputRichTextArea(param1:ILabelArea)
      {
         super();
         _richTextArea = DisplayObjectFactory.createRichLabelAreaFromSettings({
            "id":"chatOutput",
            "width":param1.width,
            "height":param1.height,
            "fontName":param1.fontName,
            "fontSize":param1.fontSize,
            "color":param1.textColor,
            "hAlign":param1.hAlign,
            "vAlign":param1.vAlign,
            "leading":param1.leading,
            "kerning":param1.kerning
         });
         _richTextArea.wordWrap = true;
         _richTextArea.selectable = true;
         var _loc7_:int = 0;
         var _loc6_:* = GuildChatEmoticon.getAllEmoticons();
         for each(var _loc3_ in GuildChatEmoticon.getAllEmoticons())
         {
            var _loc5_:int = 0;
            var _loc4_:* = _loc3_.codes;
            for each(var _loc2_ in _loc3_.codes)
            {
               _richTextArea.registerElement(_loc2_,requestVisual,new TypedObject({
                  "imageUrl":_loc3_.imageUrl,
                  "identifier":_loc3_.identifier
               }));
            }
         }
         FlashRichTextField(_richTextArea)._container.x = param1.x;
         param1.parent.addChild(FlashRichTextField(_richTextArea)._container);
         param1.visible = false;
         _iconTooltip = new UiTextTooltip(null,"");
         _itemTooltip = new UiLinkedItemTooltip(null);
         _richTextArea.onElementOver.add(handleElementOver);
         _richTextArea.onElementOut.add(handleElementOut);
      }
      
      public function registerItem(param1:String, param2:String, param3:Object) : void
      {
         _richTextArea.registerElement(param1,requestVisual,new TypedObject({
            "imageUrl":param2,
            "item":param3
         }));
      }
      
      override public function set x(param1:Number) : void
      {
         _richTextArea.x = param1;
      }
      
      override public function get x() : Number
      {
         return _richTextArea.x;
      }
      
      override public function set y(param1:Number) : void
      {
         _richTextArea.y = param1;
      }
      
      override public function get y() : Number
      {
         return _richTextArea.y;
      }
      
      override public function set width(param1:Number) : void
      {
         _richTextArea.width = param1;
      }
      
      override public function get width() : Number
      {
         return _richTextArea.width;
      }
      
      override public function set height(param1:Number) : void
      {
         _richTextArea.height = param1;
      }
      
      override public function get height() : Number
      {
         return _richTextArea.height;
      }
      
      override public function get textField() : ILabelArea
      {
         return _richTextArea;
      }
      
      override public function set text(param1:String) : void
      {
         _richTextArea.text = param1;
      }
      
      override public function clear() : void
      {
         _richTextArea.clear();
      }
      
      override public function appendText(param1:String) : void
      {
         _richTextArea.appendText(param1);
      }
      
      override public function replaceText(param1:String, param2:String) : void
      {
         _richTextArea.replaceText(param1,param2);
      }
      
      public function set emoticonsEnabled(param1:Boolean) : void
      {
         _richTextArea.showElements = param1;
      }
      
      public function get scrollValue() : int
      {
         return int(_richTextArea.getScrollValue(Direction.HORIZONTAL));
      }
      
      public function set scrollValue(param1:int) : void
      {
         _richTextArea.scrollTo(Direction.HORIZONTAL,param1,0);
      }
      
      private function requestVisual(param1:String, param2:TypedObject) : IDisplayObject
      {
         return UriSprite.load(param2.getString("imageUrl"),18,18,true,99999);
      }
      
      private function handleElementOver(param1:String, param2:TypedObject) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && !param2.hasData("item"))
         {
            _iconTooltip.text = param1;
            TooltipLayer.instance.tooltip = _iconTooltip;
            TooltipLayer.instance.tooltipVisible = true;
         }
         else
         {
            _loc3_ = param2.getData("item");
            if(_loc3_ is LinkedBooster)
            {
               _iconTooltip.text = (_loc3_ as LinkedBooster).getTooltip();
               TooltipLayer.instance.tooltip = _iconTooltip;
               _iconTooltip.onAssigned();
               TooltipLayer.instance.tooltipVisible = true;
            }
            else if(_loc3_ is LinkedItem)
            {
               _loc4_ = _loc3_ as LinkedItem;
               _itemTooltip.refresh(_loc4_);
               UiLinkedItemTooltip.compareItem = User.current.character.getItemByType(_loc4_.type);
               TooltipLayer.instance.tooltip = _itemTooltip;
               _itemTooltip.onAssigned();
               TooltipLayer.instance.tooltipVisible = true;
            }
            else if(_loc3_ is LinkedGuildBooster)
            {
               _iconTooltip.text = (_loc3_ as LinkedGuildBooster).getTooltip();
               TooltipLayer.instance.tooltip = _iconTooltip;
               _iconTooltip.onAssigned();
               TooltipLayer.instance.tooltipVisible = true;
            }
         }
      }
      
      private function handleElementOut(param1:String, param2:TypedObject) : void
      {
         TooltipLayer.instance.tooltipVisible = false;
      }
   }
}
