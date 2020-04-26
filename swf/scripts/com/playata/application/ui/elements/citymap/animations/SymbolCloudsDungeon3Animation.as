package com.playata.application.ui.elements.citymap.animations
{
   import com.greensock.TimelineMax;
   import com.greensock.easing.Linear;
   import visuals.ui.elements.citymap.SymbolCloudsDungeon3Generic;
   
   public class SymbolCloudsDungeon3Animation implements ICitymapButtonClouds
   {
       
      
      private var _displayObject:SymbolCloudsDungeon3Generic = null;
      
      public function SymbolCloudsDungeon3Animation(param1:SymbolCloudsDungeon3Generic)
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
            "x":-5,
            "y":18,
            "scaleX":0.5,
            "scaleY":0.5,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":-18,
            "y":27,
            "scaleX":0.5,
            "scaleY":0.5
         });
         _loc3_.to(_displayObject.symbolCloud2_1,0.166666666666667,{
            "x":-24,
            "y":31,
            "scaleX":0.5,
            "scaleY":0.5,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc3_.play();
         _loc4_.add(_loc3_,0);
         var _loc2_:TimelineMax = new TimelineMax({"paused":true});
         _loc2_.fromTo(_displayObject.symbolCloud2_2,0.833333333333333,{
            "x":-1,
            "y":-27,
            "scaleX":0.5,
            "scaleY":0.5,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":-36,
            "y":-10,
            "scaleX":0.5,
            "scaleY":0.5
         });
         _loc2_.to(_displayObject.symbolCloud2_2,0.166666666666667,{
            "x":-52,
            "y":-2,
            "scaleX":0.5,
            "scaleY":0.5,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc2_.play();
         _loc4_.add(_loc2_,0);
         var _loc1_:TimelineMax = new TimelineMax({"paused":true});
         _loc1_.fromTo(_displayObject.symbolCloud2_3,0.833333333333333,{
            "x":9,
            "y":-16,
            "scaleX":0.6,
            "scaleY":0.6,
            "immediateRender":false,
            "ease":Linear.easeNone
         },{
            "x":47,
            "y":-42,
            "scaleX":0.6,
            "scaleY":0.6
         });
         _loc1_.to(_displayObject.symbolCloud2_3,0.166666666666667,{
            "x":63,
            "y":-53,
            "scaleX":0.6,
            "scaleY":0.6,
            "alpha":0,
            "ease":Linear.easeNone
         });
         _loc1_.play();
         _loc4_.add(_loc1_,0);
         _loc4_.play();
      }
   }
}
