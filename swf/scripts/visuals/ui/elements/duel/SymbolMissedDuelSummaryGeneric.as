package visuals.ui.elements.duel
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.backgrounds.SymbolBackgroundScalableGeneric;
   
   public class SymbolMissedDuelSummaryGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolMissedDuelSummary = null;
      
      public var symbolBackgroundScalable:SymbolBackgroundScalableGeneric = null;
      
      public var txtNumAttacks:ILabel = null;
      
      public var txtNumWonCaption:ILabel = null;
      
      public var txtNumWon:ILabel = null;
      
      public var txtNumLostCaption:ILabel = null;
      
      public var txtNumLost:ILabel = null;
      
      public var txtTotalHonorCaption:ILabel = null;
      
      public var txtTotalHonor:ILabel = null;
      
      public function SymbolMissedDuelSummaryGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolMissedDuelSummary;
         }
         else
         {
            _nativeObject = new SymbolMissedDuelSummary();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         symbolBackgroundScalable = new SymbolBackgroundScalableGeneric(_nativeObject.symbolBackgroundScalable);
         txtNumAttacks = FlashLabel.fromNative(_nativeObject.txtNumAttacks);
         txtNumWonCaption = FlashLabel.fromNative(_nativeObject.txtNumWonCaption);
         txtNumWon = FlashLabel.fromNative(_nativeObject.txtNumWon);
         txtNumLostCaption = FlashLabel.fromNative(_nativeObject.txtNumLostCaption);
         txtNumLost = FlashLabel.fromNative(_nativeObject.txtNumLost);
         txtTotalHonorCaption = FlashLabel.fromNative(_nativeObject.txtTotalHonorCaption);
         txtTotalHonor = FlashLabel.fromNative(_nativeObject.txtTotalHonor);
      }
      
      public function setNativeInstance(param1:SymbolMissedDuelSummary) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.symbolBackgroundScalable)
         {
            symbolBackgroundScalable.setNativeInstance(_nativeObject.symbolBackgroundScalable);
         }
         FlashLabel.setNativeInstance(txtNumAttacks,_nativeObject.txtNumAttacks);
         FlashLabel.setNativeInstance(txtNumWonCaption,_nativeObject.txtNumWonCaption);
         FlashLabel.setNativeInstance(txtNumWon,_nativeObject.txtNumWon);
         FlashLabel.setNativeInstance(txtNumLostCaption,_nativeObject.txtNumLostCaption);
         FlashLabel.setNativeInstance(txtNumLost,_nativeObject.txtNumLost);
         FlashLabel.setNativeInstance(txtTotalHonorCaption,_nativeObject.txtTotalHonorCaption);
         FlashLabel.setNativeInstance(txtTotalHonor,_nativeObject.txtTotalHonor);
      }
   }
}
