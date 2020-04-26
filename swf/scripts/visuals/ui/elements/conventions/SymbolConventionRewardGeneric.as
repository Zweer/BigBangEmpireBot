package visuals.ui.elements.conventions
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.icons.SymbolIconEnergyGeneric;
   
   public class SymbolConventionRewardGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolConventionReward = null;
      
      public var txtValue:ILabel = null;
      
      public var iconQuestEnergy:SymbolIconEnergyGeneric = null;
      
      public function SymbolConventionRewardGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolConventionReward;
         }
         else
         {
            _nativeObject = new SymbolConventionReward();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtValue = FlashLabel.fromNative(_nativeObject.txtValue);
         iconQuestEnergy = new SymbolIconEnergyGeneric(_nativeObject.iconQuestEnergy);
      }
      
      public function setNativeInstance(param1:SymbolConventionReward) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtValue,_nativeObject.txtValue);
         if(_nativeObject.iconQuestEnergy)
         {
            iconQuestEnergy.setNativeInstance(_nativeObject.iconQuestEnergy);
         }
      }
   }
}
