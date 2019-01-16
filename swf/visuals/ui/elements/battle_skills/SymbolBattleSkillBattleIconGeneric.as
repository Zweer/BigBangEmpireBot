package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolBattleSkillBattleIconGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleSkillBattleIcon = null;
      
      public var img:SymbolPlaceholderGeneric = null;
      
      public var numItems:ILabelArea = null;
      
      public function SymbolBattleSkillBattleIconGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleSkillBattleIcon;
         }
         else
         {
            _nativeObject = new SymbolBattleSkillBattleIcon();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         img = new SymbolPlaceholderGeneric(_nativeObject.img);
         numItems = FlashLabelArea.fromNative(_nativeObject.numItems);
      }
      
      public function setNativeInstance(param1:SymbolBattleSkillBattleIcon) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.img)
         {
            img.setNativeInstance(_nativeObject.img);
         }
         FlashLabelArea.setNativeInstance(numItems,_nativeObject.numItems);
      }
   }
}
