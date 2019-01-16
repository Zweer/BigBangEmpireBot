package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowRightBlueGeneric;
   
   public class SymbolGoalStatisticLineGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalStatisticLine = null;
      
      public var backgroundOdd:SymbolGoalHighlightGeneric = null;
      
      public var btnRight:SymbolButtonArrowRightBlueGeneric = null;
      
      public var iconGoal:SymbolPlaceholderGeneric = null;
      
      public var txtShortDescription:ILabel = null;
      
      public var txtTitle:ILabel = null;
      
      public function SymbolGoalStatisticLineGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalStatisticLine;
         }
         else
         {
            _nativeObject = new SymbolGoalStatisticLine();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         backgroundOdd = new SymbolGoalHighlightGeneric(_nativeObject.backgroundOdd);
         btnRight = new SymbolButtonArrowRightBlueGeneric(_nativeObject.btnRight);
         iconGoal = new SymbolPlaceholderGeneric(_nativeObject.iconGoal);
         txtShortDescription = FlashLabel.fromNative(_nativeObject.txtShortDescription);
         txtTitle = FlashLabel.fromNative(_nativeObject.txtTitle);
      }
      
      public function setNativeInstance(param1:SymbolGoalStatisticLine) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.backgroundOdd)
         {
            backgroundOdd.setNativeInstance(_nativeObject.backgroundOdd);
         }
         if(_nativeObject.btnRight)
         {
            btnRight.setNativeInstance(_nativeObject.btnRight);
         }
         if(_nativeObject.iconGoal)
         {
            iconGoal.setNativeInstance(_nativeObject.iconGoal);
         }
         FlashLabel.setNativeInstance(txtShortDescription,_nativeObject.txtShortDescription);
         FlashLabel.setNativeInstance(txtTitle,_nativeObject.txtTitle);
      }
   }
}
