package visuals.ui.elements.battle
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.elements.duel.SymbolHealthbarMaskGeneric;
   
   public class SymbolBattleHitpointBarGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleHitpointBar = null;
      
      public var fill:SymbolBattleHitpointBarFillGeneric = null;
      
      public var fillRed:SymbolBattleHitpointBarFillRedGeneric = null;
      
      public var m:SymbolHealthbarMaskGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolBattleHitpointBarGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleHitpointBar;
         }
         else
         {
            _nativeObject = new SymbolBattleHitpointBar();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         fill = new SymbolBattleHitpointBarFillGeneric(_nativeObject.fill);
         fillRed = new SymbolBattleHitpointBarFillRedGeneric(_nativeObject.fillRed);
         m = new SymbolHealthbarMaskGeneric(_nativeObject.m);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolBattleHitpointBar) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.fill)
         {
            fill.setNativeInstance(_nativeObject.fill);
         }
         if(_nativeObject.fillRed)
         {
            fillRed.setNativeInstance(_nativeObject.fillRed);
         }
         if(_nativeObject.m)
         {
            m.setNativeInstance(_nativeObject.m);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
