package com.playata.application.ui.elements.citymap.animations
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Linear;
   import visuals.ui.elements.citymap.SymbolCloudsLocation3Generic;
   
   public class SymbolCloudsLocation3Animation implements ICitymapButtonClouds
   {
       
      
      private var _displayObject:SymbolCloudsLocation3Generic = null;
      
      public function SymbolCloudsLocation3Animation(param1:SymbolCloudsLocation3Generic)
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
         var _loc5_:TimelineMax = new TimelineMax({"paused":true});
         var _loc4_:TimelineMax = new TimelineMax({"paused":true});
         _loc4_.fromTo(_displayObject.symbolCloud3_1,0.833333333333333,{
            "x":9,
            "y":74,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":78,
            "y":53
         });
         _loc4_.to(_displayObject.symbolCloud3_1,0.166666666666667,{
            "x":109,
            "y":44,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc4_.play();
         _loc5_.add(_loc4_,0);
         var _loc3_:TimelineMax = new TimelineMax({"paused":true});
         _loc3_.fromTo(_displayObject.symbolCloud3_2,0.833333333333333,{
            "x":63,
            "y":-20,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":90,
            "y":-41
         });
         _loc3_.to(_displayObject.symbolCloud3_2,0.166666666666667,{
            "x":103,
            "y":-50,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc3_.play();
         _loc5_.add(_loc3_,0);
         var _loc2_:TimelineMax = new TimelineMax({"paused":true});
         _loc2_.fromTo(_displayObject.symbolCloud3_3,0.833333333333333,{
            "x":-5,
            "y":-20,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":-82,
            "y":0
         });
         _loc2_.to(_displayObject.symbolCloud3_3,0.166666666666667,{
            "x":-115,
            "y":10,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc2_.play();
         _loc5_.add(_loc2_,0);
         var _loc1_:TimelineMax = new TimelineMax({"paused":true});
         _loc1_.fromTo(_displayObject.symbolCloud3_4,0.833333333333333,{
            "x":20,
            "y":9,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":-22,
            "y":57
         });
         _loc1_.to(_displayObject.symbolCloud3_4,0.166666666666667,{
            "x":-40,
            "y":79,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc1_.play();
         _loc5_.add(_loc1_,0);
         _loc5_.play();
      }
   }
}
