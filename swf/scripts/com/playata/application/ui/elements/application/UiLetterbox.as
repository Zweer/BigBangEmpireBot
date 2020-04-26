package com.playata.application.ui.elements.application
{
   import com.greensock.easing.Power1;
   import com.playata.framework.application.Environment;
   import visuals.ui.elements.quest.SymbolLetterboxGeneric;
   
   public class UiLetterbox
   {
       
      
      private var _content:SymbolLetterboxGeneric = null;
      
      public function UiLetterbox(param1:SymbolLetterboxGeneric)
      {
         super();
         _content = param1;
      }
      
      public function fadeIn() : void
      {
         if(_content.top.isTweening)
         {
            return;
         }
         _content.top.tweenFromTo(1,{"y":-60},{
            "y":0,
            "ease":Power1.easeInOut
         });
         _content.bottom.tweenFromTo(1,{"y":Environment.layout.appHeight},{
            "y":Environment.layout.appHeight - 60,
            "ease":Power1.easeInOut
         });
      }
      
      public function fadeOut() : void
      {
         if(_content.top.y == -60)
         {
            return;
         }
         if(_content.top.isTweening)
         {
            return;
         }
         _content.top.tweenFromTo(1,{"y":0},{
            "y":-60,
            "ease":Power1.easeInOut
         });
         _content.bottom.tweenFromTo(1,{"y":Environment.layout.appHeight - 60},{
            "y":Environment.layout.appHeight,
            "ease":Power1.easeInOut
         });
      }
   }
}
