package visuals.ui.elements.goal
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.buttons.SymbolButtonArrowDownGeneric;
   import visuals.ui.elements.buttons.SymbolButtonArrowUpGeneric;
   
   public class SymbolGoalListGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGoalList = null;
      
      public var txtCompleted:ILabel = null;
      
      public var txtPending:ILabel = null;
      
      public var btnUp:SymbolButtonArrowUpGeneric = null;
      
      public var btnDown:SymbolButtonArrowDownGeneric = null;
      
      public var line1:SymbolGoalLineGeneric = null;
      
      public var line2:SymbolGoalLineGeneric = null;
      
      public var line3:SymbolGoalLineGeneric = null;
      
      public var line4:SymbolGoalLineGeneric = null;
      
      public var txtNoGoals:ILabelArea = null;
      
      public var line5:SymbolGoalLineGeneric = null;
      
      public function SymbolGoalListGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGoalList;
         }
         else
         {
            _nativeObject = new SymbolGoalList();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtCompleted = FlashLabel.fromNative(_nativeObject.txtCompleted);
         txtPending = FlashLabel.fromNative(_nativeObject.txtPending);
         btnUp = new SymbolButtonArrowUpGeneric(_nativeObject.btnUp);
         btnDown = new SymbolButtonArrowDownGeneric(_nativeObject.btnDown);
         line1 = new SymbolGoalLineGeneric(_nativeObject.line1);
         line2 = new SymbolGoalLineGeneric(_nativeObject.line2);
         line3 = new SymbolGoalLineGeneric(_nativeObject.line3);
         line4 = new SymbolGoalLineGeneric(_nativeObject.line4);
         txtNoGoals = FlashLabelArea.fromNative(_nativeObject.txtNoGoals);
         line5 = new SymbolGoalLineGeneric(_nativeObject.line5);
      }
      
      public function setNativeInstance(param1:SymbolGoalList) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtCompleted,_nativeObject.txtCompleted);
         FlashLabel.setNativeInstance(txtPending,_nativeObject.txtPending);
         if(_nativeObject.btnUp)
         {
            btnUp.setNativeInstance(_nativeObject.btnUp);
         }
         if(_nativeObject.btnDown)
         {
            btnDown.setNativeInstance(_nativeObject.btnDown);
         }
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
         FlashLabelArea.setNativeInstance(txtNoGoals,_nativeObject.txtNoGoals);
         if(_nativeObject.line5)
         {
            line5.setNativeInstance(_nativeObject.line5);
         }
      }
   }
}
