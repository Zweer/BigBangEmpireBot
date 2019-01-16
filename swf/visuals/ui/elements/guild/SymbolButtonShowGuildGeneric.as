package visuals.ui.elements.guild
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolUiButtonDefaultShapeSmallGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   
   public class SymbolButtonShowGuildGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolButtonShowGuild = null;
      
      public var bg:SymbolUiButtonDefaultShapeSmallGeneric = null;
      
      public var symbolIconGuild:SymbolIconGuildGeneric = null;
      
      public function SymbolButtonShowGuildGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolButtonShowGuild;
         }
         else
         {
            _nativeObject = new SymbolButtonShowGuild();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         bg = new SymbolUiButtonDefaultShapeSmallGeneric(_nativeObject.bg);
         symbolIconGuild = new SymbolIconGuildGeneric(_nativeObject.symbolIconGuild);
      }
      
      public function setNativeInstance(param1:SymbolButtonShowGuild) : void
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
         if(_nativeObject.symbolIconGuild)
         {
            symbolIconGuild.setNativeInstance(_nativeObject.symbolIconGuild);
         }
      }
   }
}
