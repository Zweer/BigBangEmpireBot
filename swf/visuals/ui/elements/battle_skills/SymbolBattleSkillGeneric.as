package visuals.ui.elements.battle_skills
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   
   public class SymbolBattleSkillGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolBattleSkill = null;
      
      public var bg:SymbolBattleSkillBackgroundGeneric = null;
      
      public var icon:SymbolBattleSkillIconGeneric = null;
      
      public var txtTitle:ILabelArea = null;
      
      public var txtDescription:ILabelArea = null;
      
      public function SymbolBattleSkillGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolBattleSkill;
         }
         else
         {
            _nativeObject = new SymbolBattleSkill();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolBattleSkillBackgroundGeneric(_nativeObject.bg);
         icon = new SymbolBattleSkillIconGeneric(_nativeObject.icon);
         txtTitle = FlashLabelArea.fromNative(_nativeObject.txtTitle);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
      }
      
      public function setNativeInstance(param1:SymbolBattleSkill) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.bg)
         {
            bg.setNativeInstance(_nativeObject.bg);
         }
         if(_nativeObject.icon)
         {
            icon.setNativeInstance(_nativeObject.icon);
         }
         FlashLabelArea.setNativeInstance(txtTitle,_nativeObject.txtTitle);
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
      }
   }
}
