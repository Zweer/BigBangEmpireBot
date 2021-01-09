package com.playata.application.ui.elements.hud
{
   import com.greensock.TimelineMax;
   import com.playata.application.data.GameUtil;
   import com.playata.application.data.user.User;
   import visuals.ui.elements.quest.SymbolGameTipGeneric;
   
   public class UiGameTip
   {
       
      
      private var _gameTip:SymbolGameTipGeneric = null;
      
      private var _timeline:TimelineMax = null;
      
      public function UiGameTip(param1:SymbolGameTipGeneric)
      {
         super();
         _gameTip = param1;
         hide();
      }
      
      public function dispose() : void
      {
         _gameTip = null;
      }
      
      public function show() : void
      {
         if(User.current.character.level > 1)
         {
            if(!_timeline)
            {
               _timeline = new TimelineMax({
                  "repeat":-1,
                  "paused":true
               });
               _timeline.addLabel("UiGameTip");
               _timeline.fromTo(_gameTip.message,6,{"alpha":0},{"alpha":1},5.7);
               _timeline.fromTo(_gameTip.message,2,{
                  "alpha":1,
                  "immediateRender":false
               },{"alpha":0},18);
               _timeline.call(function():void
               {
                  nextTip();
               },null,26);
            }
            _timeline.play(0);
         }
         _gameTip.visible = User.current.character.level > 1;
         nextTip();
      }
      
      public function hide() : void
      {
         if(_timeline)
         {
            _timeline.kill();
            _timeline = null;
         }
         _gameTip.visible = false;
      }
      
      private function nextTip() : void
      {
         if(!User.current || !User.current.character)
         {
            return;
         }
         _gameTip.message.caption.text = GameUtil.getHint(User.current.character.level);
         if(_gameTip.message.caption.numLines > 2)
         {
            _gameTip.message.caption.y = -16;
         }
         else if(_gameTip.message.caption.numLines > 1)
         {
            _gameTip.message.caption.y = -8;
         }
         else
         {
            _gameTip.message.caption.y = 0;
         }
      }
   }
}
