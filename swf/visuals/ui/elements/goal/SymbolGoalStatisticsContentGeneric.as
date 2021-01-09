package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolGoalStatisticsContentGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalStatisticsContent = null;
      
      public var line1:SymbolGoalStatisticLineGeneric = null;
      
      public var line2:SymbolGoalStatisticLineGeneric = null;
      
      public var line3:SymbolGoalStatisticLineGeneric = null;
      
      public var line4:SymbolGoalStatisticLineGeneric = null;
      
      public var line5:SymbolGoalStatisticLineGeneric = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public function SymbolGoalStatisticsContentGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalStatisticsContent;
         }
         else
         {
            _nativeObject = new SymbolGoalStatisticsContent();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         line1 = new SymbolGoalStatisticLineGeneric(_nativeObject.line1);
         line2 = new SymbolGoalStatisticLineGeneric(_nativeObject.line2);
         line3 = new SymbolGoalStatisticLineGeneric(_nativeObject.line3);
         line4 = new SymbolGoalStatisticLineGeneric(_nativeObject.line4);
         line5 = new SymbolGoalStatisticLineGeneric(_nativeObject.line5);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
      }
      
      public function setNativeInstance(param1:SymbolGoalStatisticsContent) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.line1)
         {
            line1.setNativeInstance(_nativeObject.line1);
         }
         if(_nativeObject.line2)
         {
            line2.setNativeInstance(_nativeObject.line2);
         }
         if(_nativeObject.line3)
         {
            line3.setNativeInstance(_nativeObject.line3);
         }
         if(_nativeObject.line4)
         {
            line4.setNativeInstance(_nativeObject.line4);
         }
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
      }
   }
}
