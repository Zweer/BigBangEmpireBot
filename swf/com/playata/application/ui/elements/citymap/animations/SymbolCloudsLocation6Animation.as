package com.playata.application.ui.elements.citymap.animations
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Linear;
   import visuals.ui.elements.citymap.SymbolCloudsLocation6Generic;
   
   public class SymbolCloudsLocation6Animation implements ICitymapButtonClouds
   {
       
      
      private var _displayObject:SymbolCloudsLocation6Generic = null;
      
      public function SymbolCloudsLocation6Animation(param1:SymbolCloudsLocation6Generic)
      {
         super();
         _displayObject = param1;
      }
      
      public function locked() : void
      {
      }
      
      public function available() : void
      {
         _displayObject.visible = false;
      }
      
      public function showing() : void
      {
         var _loc4_:TimelineMax = new TimelineMax({"paused":true});
         var _loc3_:TimelineMax = new TimelineMax({"paused":true});
         _loc3_.fromTo(_displayObject.symbolCloud4_1,0.833333333333333,{
            "x":18,
            "y":-36,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":-66,
            "y":-30
         });
         _loc3_.to(_displayObject.symbolCloud4_1,0.166666666666667,{
            "x":-102,
            "y":-26,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc3_.play();
         _loc4_.add(_loc3_,0);
         var _loc2_:TimelineMax = new TimelineMax({"paused":true});
         _loc2_.fromTo(_displayObject.symbolCloud4_2,0.833333333333333,{
            "x":0,
            "y":24,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":56,
            "y":87
         });
         _loc2_.to(_displayObject.symbolCloud4_2,0.166666666666667,{
            "x":80,
            "y":114,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc2_.play();
         _loc4_.add(_loc2_,0);
         var _loc1_:TimelineMax = new TimelineMax({"paused":true});
         _loc1_.fromTo(_displayObject.symbolCloud4_3,0.833333333333333,{
            "x":47,
            "y":-4,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":81,
            "y":-18
         });
         _loc1_.to(_displayObject.symbolCloud4_3,0.166666666666667,{
            "x":97,
            "y":-24,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc1_.play();
         _loc4_.add(_loc1_,0);
         _loc4_.play();
      }
   }
}
