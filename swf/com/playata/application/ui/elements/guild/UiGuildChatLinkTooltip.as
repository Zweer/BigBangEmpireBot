package com.playata.application.ui.elements.guild
{
   import com.playata.framework.display.DisplayCoreConfig;
   import com.playata.framework.display.InteractiveDisplayObject;
   import com.playata.framework.input.InteractionEvent;
   import visuals.ui.base.SymbolUiGuildChatLinkTooltipGeneric;
   
   public class UiGuildChatLinkTooltip
   {
      
      private static var BORDER:int = 20;
      
      private static var BACKGROUND_WIDTH:int = 265;
      
      private static var LINE_HEIGHT:int = 50;
      
      private static var TWO_COLOMNS:int = 6;
       
      
      private var _content:SymbolUiGuildChatLinkTooltipGeneric;
      
      private var _lines:Vector.<UiGuildChatLinkTooltipLine>;
      
      private var _clickLayer:InteractiveDisplayObject;
      
      private var _onLinkClick:Function;
      
      public function UiGuildChatLinkTooltip(param1:SymbolUiGuildChatLinkTooltipGeneric, param2:Function)
      {
         _lines = new Vector.<UiGuildChatLinkTooltipLine>();
         super();
         _content = param1;
         _content.lines.removeAllChildren();
         _content.visible = false;
         _clickLayer = new InteractiveDisplayObject(_content);
         _clickLayer.onClick.add(handleClick);
         _onLinkClick = param2;
      }
      
      private function handleClick(param1:InteractionEvent) : void
      {
         _content.visible = false;
      }
      
      private function handleLinkClick(param1:String) : void
      {
         _content.visible = false;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < _lines.length)
         {
            _lines[_loc1_].dispose();
            _loc1_++;
         }
         _lines = null;
         _clickLayer.dispose();
         _clickLayer = null;
      }
      
      public function refresh(param1:InteractionEvent) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = null;
         var _loc6_:int = 0;
         var _loc2_:Vector.<String> = param1.linkVector;
         var _loc5_:int = 0;
         _loc4_ = 1;
         while(_loc4_ < _loc2_.length)
         {
            _loc5_ = _loc4_ - 1;
            _loc3_ = null;
            if(_lines.length > _loc5_)
            {
               _loc3_ = _lines[_loc5_];
            }
            else
            {
               _loc3_ = new UiGuildChatLinkTooltipLine(handleLinkClick);
               _content.lines.addChild(_loc3_);
               _lines.push(_loc3_);
            }
            if(_loc2_.length > TWO_COLOMNS)
            {
               _loc6_ = Math.ceil((_loc5_ + 1) / 2) - 1;
               _loc3_.x = _loc5_ % 2 != 0?_loc3_.width + BORDER * 2:0;
               _loc3_.y = _loc6_ * LINE_HEIGHT;
            }
            else
            {
               _loc3_.x = 0;
               _loc3_.y = _loc5_ * LINE_HEIGHT;
            }
            _loc3_.refresh(_loc2_[0],_loc2_[_loc4_]);
            _loc3_.visible = true;
            _loc4_++;
         }
         _loc5_++;
         _loc5_;
         while(_loc5_ < _lines.length)
         {
            _lines[_loc5_].visible = false;
            _loc5_++;
         }
         if(_loc2_.length > TWO_COLOMNS)
         {
            _content.background.height = BORDER * 2 + LINE_HEIGHT * Math.ceil((_loc2_.length - 1) / 2);
            _content.background.width = BACKGROUND_WIDTH * 2;
         }
         else
         {
            _content.background.height = BORDER * 2 + LINE_HEIGHT * (_loc2_.length - 1);
            _content.background.width = BACKGROUND_WIDTH;
         }
         _content.background.x = Math.min(param1.globalX,DisplayCoreConfig.layout.appWidth - _content.background.width - 15);
         _content.background.y = Math.max(param1.globalY - _content.background.height - 10,100);
         _content.lines.x = _content.background.x + BORDER;
         _content.lines.y = _content.background.y + BORDER;
         _content.visible = true;
      }
   }
}
