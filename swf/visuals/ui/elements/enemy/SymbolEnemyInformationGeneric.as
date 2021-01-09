package visuals.ui.elements.enemy
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import flash.display.MovieClip;
   import visuals.ui.elements.generic.SymbolBasePanelIconLevelGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   import visuals.ui.elements.icons.SymbolIconHonorGeneric;
   import visuals.ui.elements.icons.SymbolIconMoviesGeneric;
   
   public class SymbolEnemyInformationGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolEnemyInformation = null;
      
      public var iconHonor:SymbolIconHonorGeneric = null;
      
      public var txtHonor:ILabel = null;
      
      public var iconLevel:SymbolBasePanelIconLevelGeneric = null;
      
      public var txtLevel:ILabel = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var txtFans:ILabel = null;
      
      public var iconMovies:SymbolIconMoviesGeneric = null;
      
      public var txtMovies:ILabel = null;
      
      public var iconGuild:SymbolIconGuildGeneric = null;
      
      public var guildEmblem:SymbolGuildEmblemGeneric = null;
      
      public var txtGuildName:ILabel = null;
      
      public function SymbolEnemyInformationGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolEnemyInformation;
         }
         else
         {
            _nativeObject = new SymbolEnemyInformation();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         iconHonor = new SymbolIconHonorGeneric(_nativeObject.iconHonor);
         txtHonor = FlashLabel.fromNative(_nativeObject.txtHonor);
         iconLevel = new SymbolBasePanelIconLevelGeneric(_nativeObject.iconLevel);
         txtLevel = FlashLabel.fromNative(_nativeObject.txtLevel);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         txtFans = FlashLabel.fromNative(_nativeObject.txtFans);
         iconMovies = new SymbolIconMoviesGeneric(_nativeObject.iconMovies);
         txtMovies = FlashLabel.fromNative(_nativeObject.txtMovies);
         iconGuild = new SymbolIconGuildGeneric(_nativeObject.iconGuild);
         guildEmblem = new SymbolGuildEmblemGeneric(_nativeObject.guildEmblem);
         txtGuildName = FlashLabel.fromNative(_nativeObject.txtGuildName);
      }
      
      public function setNativeInstance(param1:SymbolEnemyInformation) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         FlashLabel.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         if(_nativeObject.iconLevel)
         {
            iconLevel.setNativeInstance(_nativeObject.iconLevel);
         }
         FlashLabel.setNativeInstance(txtLevel,_nativeObject.txtLevel);
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         FlashLabel.setNativeInstance(txtFans,_nativeObject.txtFans);
         if(_nativeObject.iconMovies)
         {
            iconMovies.setNativeInstance(_nativeObject.iconMovies);
         }
         FlashLabel.setNativeInstance(txtMovies,_nativeObject.txtMovies);
         if(_nativeObject.iconGuild)
         {
            iconGuild.setNativeInstance(_nativeObject.iconGuild);
         }
         if(_nativeObject.guildEmblem)
         {
            guildEmblem.setNativeInstance(_nativeObject.guildEmblem);
         }
         FlashLabel.setNativeInstance(txtGuildName,_nativeObject.txtGuildName);
      }
   }
}
