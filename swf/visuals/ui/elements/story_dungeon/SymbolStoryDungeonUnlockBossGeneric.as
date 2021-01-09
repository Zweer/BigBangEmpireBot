package visuals.ui.elements.story_dungeon
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   
   public class SymbolStoryDungeonUnlockBossGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolStoryDungeonUnlockBoss = null;
      
      public var iconBoss:SymbolPlaceholderGeneric = null;
      
      public var txtInfo:ILabelArea = null;
      
      public function SymbolStoryDungeonUnlockBossGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolStoryDungeonUnlockBoss;
         }
         else
         {
            _nativeObject = new SymbolStoryDungeonUnlockBoss();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconBoss = new SymbolPlaceholderGeneric(_nativeObject.iconBoss);
         txtInfo = FlashLabelArea.fromNative(_nativeObject.txtInfo);
      }
      
      public function setNativeInstance(param1:SymbolStoryDungeonUnlockBoss) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconBoss)
         {
            iconBoss.setNativeInstance(_nativeObject.iconBoss);
         }
         FlashLabelArea.setNativeInstance(txtInfo,_nativeObject.txtInfo);
      }
   }
}
