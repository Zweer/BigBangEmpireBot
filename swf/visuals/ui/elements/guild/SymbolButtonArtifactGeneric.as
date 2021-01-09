package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolPlaceholderGeneric;
   import visuals.ui.elements.icons.SymbolIconFreeArtifactSlotGeneric;
   import visuals.ui.elements.icons.SymbolIconLockGeneric;
   
   public class SymbolButtonArtifactGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonArtifact = null;
      
      public var artifactSlot:SymbolIconFreeArtifactSlotGeneric = null;
      
      public var artifact:SymbolPlaceholderGeneric = null;
      
      public var artifactSlotLock:SymbolIconLockGeneric = null;
      
      public var iconCross:SymbolGuildBattleArtifactLostCrossGeneric = null;
      
      public function SymbolButtonArtifactGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonArtifact;
         }
         else
         {
            _nativeObject = new SymbolButtonArtifact();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         artifactSlot = new SymbolIconFreeArtifactSlotGeneric(_nativeObject.artifactSlot);
         artifact = new SymbolPlaceholderGeneric(_nativeObject.artifact);
         artifactSlotLock = new SymbolIconLockGeneric(_nativeObject.artifactSlotLock);
         iconCross = new SymbolGuildBattleArtifactLostCrossGeneric(_nativeObject.iconCross);
      }
      
      public function setNativeInstance(param1:SymbolButtonArtifact) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.artifactSlot)
         {
            artifactSlot.setNativeInstance(_nativeObject.artifactSlot);
         }
         if(_nativeObject.artifact)
         {
            artifact.setNativeInstance(_nativeObject.artifact);
         }
         if(_nativeObject.artifactSlotLock)
         {
            artifactSlotLock.setNativeInstance(_nativeObject.artifactSlotLock);
         }
         if(_nativeObject.iconCross)
         {
            iconCross.setNativeInstance(_nativeObject.iconCross);
         }
      }
   }
}
