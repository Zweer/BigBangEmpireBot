package com.playata.application.data.resource
{
   import com.playata.application.data.dataobject.DOResourceRequest;
   import com.playata.application.data.guild.GuildMember;
   import com.playata.application.data.user.User;
   import com.playata.framework.display.ui.IListItem;
   import com.playata.framework.localization.LocText;
   
   public class ResourceRequest extends DOResourceRequest implements IListItem
   {
       
      
      public function ResourceRequest(param1:DOResourceRequest)
      {
         super(param1);
      }
      
      override public function get fromCharacterName() : String
      {
         var _loc1_:String = super.fromCharacterName;
         if(_loc1_.indexOf("_") != -1)
         {
            _loc1_ = _loc1_.substr(_loc1_.indexOf("_") + 1);
         }
         return _loc1_;
      }
      
      public function get fromCharacterGender() : int
      {
         var _loc1_:String = super.fromCharacterName;
         if(_loc1_.indexOf("f_") != -1)
         {
            return 2;
         }
         return 1;
      }
      
      public function get title() : String
      {
         var _loc1_:ResourceFeature = new ResourceFeature(featureType);
         return _loc1_.getResourceRequestTitle(fromCharacterName);
      }
      
      public function get message() : String
      {
         var _loc2_:ResourceFeature = new ResourceFeature(featureType);
         var _loc3_:int = LocText.current.gender;
         LocText.current.gender = fromCharacterGender;
         var _loc1_:String = _loc2_.getResourceRequestMessage(fromCharacterName);
         LocText.current.gender = _loc3_;
         return _loc1_;
      }
      
      public function get resourceIconIndex() : int
      {
         var _loc1_:ResourceFeature = new ResourceFeature(featureType);
         return _loc1_.resourceIconIndex;
      }
      
      public function isFromFriend(param1:Vector.<int>) : Boolean
      {
         var _loc4_:int = 0;
         var _loc3_:* = param1;
         for each(var _loc2_ in param1)
         {
            if(_loc2_ == fromUserId)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get isFromGuildMember() : Boolean
      {
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         var _loc3_:int = 0;
         var _loc2_:* = User.current.character.guild.members;
         for each(var _loc1_ in User.current.character.guild.members)
         {
            if(_loc1_.name == fromCharacterName)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get itemId() : String
      {
         return id.toString();
      }
   }
}
