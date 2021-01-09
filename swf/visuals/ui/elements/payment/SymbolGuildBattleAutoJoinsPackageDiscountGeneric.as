package visuals.ui.elements.payment
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   
   public class SymbolGuildBattleAutoJoinsPackageDiscountGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolGuildBattleAutoJoinsPackageDiscount = null;
      
      public var txtDiscount:ILabel = null;
      
      public function SymbolGuildBattleAutoJoinsPackageDiscountGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolGuildBattleAutoJoinsPackageDiscount;
         }
         else
         {
            _nativeObject = new SymbolGuildBattleAutoJoinsPackageDiscount();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         txtDiscount = FlashLabel.fromNative(_nativeObject.txtDiscount);
      }
      
      public function setNativeInstance(param1:SymbolGuildBattleAutoJoinsPackageDiscount) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         FlashLabel.setNativeInstance(txtDiscount,_nativeObject.txtDiscount);
      }
   }
}
