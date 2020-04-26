package visuals.ui.elements.application
{
   import com.playata.framework.display.Sprite;
   import com.playata.framework.display.lib.flash.FlashDisplayObjectContainer;
   import com.playata.framework.display.lib.flash.FlashLabel;
   import com.playata.framework.display.lib.flash.FlashLabelArea;
   import com.playata.framework.display.lib.flash.FlashSprite;
   import com.playata.framework.display.ui.controls.ILabel;
   import com.playata.framework.display.ui.controls.ILabelArea;
   import flash.display.MovieClip;
   import visuals.ui.base.SymbolDummyGeneric;
   import visuals.ui.base.SymbolUiCheckboxGeneric;
   import visuals.ui.elements.avatar.SymbolAvatarImagePlaceholderGeneric;
   import visuals.ui.elements.avatar.SymbolIconPhotographerGeneric;
   import visuals.ui.elements.booster.SymbolBoosterGeneric;
   import visuals.ui.elements.enemy.SymbolEnemyInformationGeneric;
   import visuals.ui.elements.generic.SymbolGenericFrameGeneric;
   import visuals.ui.elements.goal.SymbolButtonViewGoalsGeneric;
   import visuals.ui.elements.guild.SymbolButtonAppearanceGeneric;
   import visuals.ui.elements.guild.SymbolButtonInviteToGuildGeneric;
   import visuals.ui.elements.guild.SymbolButtonMoviesGeneric;
   import visuals.ui.elements.guild.SymbolButtonShowGuildGeneric;
   import visuals.ui.elements.guild.SymbolGuildEmblemGeneric;
   import visuals.ui.elements.icons.SymbolIconFansGeneric;
   import visuals.ui.elements.icons.SymbolIconGuildGeneric;
   import visuals.ui.elements.icons.SymbolIconHonorGeneric;
   import visuals.ui.elements.icons.SymbolIconMoviesGeneric;
   import visuals.ui.elements.icons.SymbolIconOnlineBigGeneric;
   import visuals.ui.elements.mail.SymbolButtonSendMessageGeneric;
   
   public class SymbolCharacterInfoBoxGeneric extends Sprite
   {
       
      
      private var _nativeObject:SymbolCharacterInfoBox = null;
      
      public var frameBackground:SymbolGenericFrameGeneric = null;
      
      public var btnViewGoals:SymbolButtonViewGoalsGeneric = null;
      
      public var btnSendMessage:SymbolButtonSendMessageGeneric = null;
      
      public var btnViewGuild:SymbolButtonShowGuildGeneric = null;
      
      public var btnInviteToGuild:SymbolButtonInviteToGuildGeneric = null;
      
      public var btnChangeAppearance:SymbolButtonAppearanceGeneric = null;
      
      public var checkFriend:SymbolUiCheckboxGeneric = null;
      
      public var txtFriend:ILabelArea = null;
      
      public var txtOnline:ILabel = null;
      
      public var iconHonor:SymbolIconHonorGeneric = null;
      
      public var iconMovies:SymbolIconMoviesGeneric = null;
      
      public var iconFans:SymbolIconFansGeneric = null;
      
      public var txtDescription:ILabelArea = null;
      
      public var clickLayerDescription:SymbolDummyGeneric = null;
      
      public var txtHonor:ILabel = null;
      
      public var txtMovies:ILabel = null;
      
      public var txtFans:ILabel = null;
      
      public var boosterType1:SymbolBoosterGeneric = null;
      
      public var boosterType2:SymbolBoosterGeneric = null;
      
      public var boosterType3:SymbolBoosterGeneric = null;
      
      public var guildEmblem:SymbolGuildEmblemGeneric = null;
      
      public var txtGuildName:ILabel = null;
      
      public var iconGuild:SymbolIconGuildGeneric = null;
      
      public var imageAvatarPlaceholder:SymbolAvatarImagePlaceholderGeneric = null;
      
      public var clickLayerAvatar:SymbolDummyGeneric = null;
      
      public var iconOnline:SymbolIconOnlineBigGeneric = null;
      
      public var enemyInformation:SymbolEnemyInformationGeneric = null;
      
      public var iconPhotographer:SymbolIconPhotographerGeneric = null;
      
      public var btnMovies:SymbolButtonMoviesGeneric = null;
      
      public function SymbolCharacterInfoBoxGeneric(param1:MovieClip = null)
      {
         if(param1)
         {
            _nativeObject = param1 as SymbolCharacterInfoBox;
         }
         else
         {
            _nativeObject = new SymbolCharacterInfoBox();
         }
         super(null,FlashSprite.fromNative(_nativeObject));
         var _loc2_:FlashDisplayObjectContainer = _sprite as FlashDisplayObjectContainer;
         frameBackground = new SymbolGenericFrameGeneric(_nativeObject.frameBackground);
         btnViewGoals = new SymbolButtonViewGoalsGeneric(_nativeObject.btnViewGoals);
         btnSendMessage = new SymbolButtonSendMessageGeneric(_nativeObject.btnSendMessage);
         btnViewGuild = new SymbolButtonShowGuildGeneric(_nativeObject.btnViewGuild);
         btnInviteToGuild = new SymbolButtonInviteToGuildGeneric(_nativeObject.btnInviteToGuild);
         btnChangeAppearance = new SymbolButtonAppearanceGeneric(_nativeObject.btnChangeAppearance);
         checkFriend = new SymbolUiCheckboxGeneric(_nativeObject.checkFriend);
         txtFriend = FlashLabelArea.fromNative(_nativeObject.txtFriend);
         txtOnline = FlashLabel.fromNative(_nativeObject.txtOnline);
         iconHonor = new SymbolIconHonorGeneric(_nativeObject.iconHonor);
         iconMovies = new SymbolIconMoviesGeneric(_nativeObject.iconMovies);
         iconFans = new SymbolIconFansGeneric(_nativeObject.iconFans);
         txtDescription = FlashLabelArea.fromNative(_nativeObject.txtDescription);
         clickLayerDescription = new SymbolDummyGeneric(_nativeObject.clickLayerDescription);
         txtHonor = FlashLabel.fromNative(_nativeObject.txtHonor);
         txtMovies = FlashLabel.fromNative(_nativeObject.txtMovies);
         txtFans = FlashLabel.fromNative(_nativeObject.txtFans);
         boosterType1 = new SymbolBoosterGeneric(_nativeObject.boosterType1);
         boosterType2 = new SymbolBoosterGeneric(_nativeObject.boosterType2);
         boosterType3 = new SymbolBoosterGeneric(_nativeObject.boosterType3);
         guildEmblem = new SymbolGuildEmblemGeneric(_nativeObject.guildEmblem);
         txtGuildName = FlashLabel.fromNative(_nativeObject.txtGuildName);
         iconGuild = new SymbolIconGuildGeneric(_nativeObject.iconGuild);
         imageAvatarPlaceholder = new SymbolAvatarImagePlaceholderGeneric(_nativeObject.imageAvatarPlaceholder);
         clickLayerAvatar = new SymbolDummyGeneric(_nativeObject.clickLayerAvatar);
         iconOnline = new SymbolIconOnlineBigGeneric(_nativeObject.iconOnline);
         enemyInformation = new SymbolEnemyInformationGeneric(_nativeObject.enemyInformation);
         iconPhotographer = new SymbolIconPhotographerGeneric(_nativeObject.iconPhotographer);
         btnMovies = new SymbolButtonMoviesGeneric(_nativeObject.btnMovies);
      }
      
      public function setNativeInstance(param1:SymbolCharacterInfoBox) : void
      {
         FlashSprite.setNativeInstance(_sprite,param1);
         _nativeObject = param1;
         syncInstances();
      }
      
      public function syncInstances() : void
      {
         if(_nativeObject.frameBackground)
         {
            frameBackground.setNativeInstance(_nativeObject.frameBackground);
         }
         if(_nativeObject.btnViewGoals)
         {
            btnViewGoals.setNativeInstance(_nativeObject.btnViewGoals);
         }
         if(_nativeObject.btnSendMessage)
         {
            btnSendMessage.setNativeInstance(_nativeObject.btnSendMessage);
         }
         if(_nativeObject.btnViewGuild)
         {
            btnViewGuild.setNativeInstance(_nativeObject.btnViewGuild);
         }
         if(_nativeObject.btnInviteToGuild)
         {
            btnInviteToGuild.setNativeInstance(_nativeObject.btnInviteToGuild);
         }
         if(_nativeObject.btnChangeAppearance)
         {
            btnChangeAppearance.setNativeInstance(_nativeObject.btnChangeAppearance);
         }
         if(_nativeObject.checkFriend)
         {
            checkFriend.setNativeInstance(_nativeObject.checkFriend);
         }
         FlashLabelArea.setNativeInstance(txtFriend,_nativeObject.txtFriend);
         FlashLabel.setNativeInstance(txtOnline,_nativeObject.txtOnline);
         if(_nativeObject.iconHonor)
         {
            iconHonor.setNativeInstance(_nativeObject.iconHonor);
         }
         if(_nativeObject.iconMovies)
         {
            iconMovies.setNativeInstance(_nativeObject.iconMovies);
         }
         if(_nativeObject.iconFans)
         {
            iconFans.setNativeInstance(_nativeObject.iconFans);
         }
         FlashLabelArea.setNativeInstance(txtDescription,_nativeObject.txtDescription);
         if(_nativeObject.clickLayerDescription)
         {
            clickLayerDescription.setNativeInstance(_nativeObject.clickLayerDescription);
         }
         FlashLabel.setNativeInstance(txtHonor,_nativeObject.txtHonor);
         FlashLabel.setNativeInstance(txtMovies,_nativeObject.txtMovies);
         FlashLabel.setNativeInstance(txtFans,_nativeObject.txtFans);
         if(_nativeObject.boosterType1)
         {
            boosterType1.setNativeInstance(_nativeObject.boosterType1);
         }
         if(_nativeObject.boosterType2)
         {
            boosterType2.setNativeInstance(_nativeObject.boosterType2);
         }
         if(_nativeObject.boosterType3)
         {
            boosterType3.setNativeInstance(_nativeObject.boosterType3);
         }
         if(_nativeObject.guildEmblem)
         {
            guildEmblem.setNativeInstance(_nativeObject.guildEmblem);
         }
         FlashLabel.setNativeInstance(txtGuildName,_nativeObject.txtGuildName);
         if(_nativeObject.iconGuild)
         {
            iconGuild.setNativeInstance(_nativeObject.iconGuild);
         }
         if(_nativeObject.imageAvatarPlaceholder)
         {
            imageAvatarPlaceholder.setNativeInstance(_nativeObject.imageAvatarPlaceholder);
         }
         if(_nativeObject.clickLayerAvatar)
         {
            clickLayerAvatar.setNativeInstance(_nativeObject.clickLayerAvatar);
         }
         if(_nativeObject.iconOnline)
         {
            iconOnline.setNativeInstance(_nativeObject.iconOnline);
         }
         if(_nativeObject.enemyInformation)
         {
            enemyInformation.setNativeInstance(_nativeObject.enemyInformation);
         }
         if(_nativeObject.iconPhotographer)
         {
            iconPhotographer.setNativeInstance(_nativeObject.iconPhotographer);
         }
         if(_nativeObject.btnMovies)
         {
            btnMovies.setNativeInstance(_nativeObject.btnMovies);
         }
      }
   }
}
