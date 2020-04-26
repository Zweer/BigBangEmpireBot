package com.playata.application.ui.elements.citymap.animations
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Linear;
   import visuals.ui.elements.citymap.SymbolCloudsLocation5Generic;
   
   public class SymbolCloudsLocation5Animation implements ICitymapButtonClouds
   {
       
      
      private var _displayObject:SymbolCloudsLocation5Generic = null;
      
      public function SymbolCloudsLocation5Animation(param1:SymbolCloudsLocation5Generic)
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
         _loc3_.fromTo(_displayObject.symbolCloud2_1,0.833333333333333,{
            "x":-9,
            "y":54,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":-35,
            "y":72
         });
         _loc3_.to(_displayObject.symbolCloud2_1,0.166666666666667,{
            "x":-46,
            "y":81,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc3_.play();
         _loc4_.add(_loc3_,0);
         var _loc2_:TimelineMax = new TimelineMax({"paused":true});
         _loc2_.fromTo(_displayObject.symbolCloud2_2,0.833333333333333,{
            "x":0,
            "y":-35,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":-72,
            "y":-1
         });
         _loc2_.to(_displayObject.symbolCloud2_2,0.166666666666667,{
            "x":-103,
            "y":14,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc2_.play();
         _loc4_.add(_loc2_,0);
         var _loc1_:TimelineMax = new TimelineMax({"paused":true});
         _loc1_.fromTo(_displayObject.symbolCloud2_3,0.833333333333333,{
            "x":20,
            "y":-14,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":94,
            "y":-65
         });
         _loc1_.to(_displayObject.symbolCloud2_3,0.166666666666667,{
            "x":127,
            "y":-87,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc1_.play();
         _loc4_.add(_loc1_,0);
         _loc4_.play();
      }
   }
}
