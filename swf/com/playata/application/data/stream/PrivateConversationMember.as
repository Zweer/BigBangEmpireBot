package com.playata.application.data.stream
{
   import com.playata.application.data.character.Character;
   import com.playata.application.data.user.User;
   import com.playata.framework.data.DataObject;
   
   public class PrivateConversationMember extends DataObject
   {
       
      
      public function PrivateConversationMember(param1:Object = null)
      {
         super(param1);
      }
      
      public function get id() : int
      {
         return getInt("id");
      }
      
      public function get name() : String
      {
         return Character.getCleanName(getString("name"));
      }
      
      public function get gender() : String
      {
         return getString("gender");
      }
      
      public function get isMale() : Boolean
      {
         return gender == "m";
      }
      
      public function get isFemale() : Boolean
      {
         return gender == "f";
      }
      
      public function get isMe() : Boolean
      {
         return id == User.current.character.id;
      }
      
      public function get isDeleted() : Boolean
      {
         var _loc1_:String = getString("name");
         return _loc1_.indexOf("___") != -1;
      }
      
      public function get imageHash() : String
      {
         if(!hasData("image_hash"))
         {
            return null;
         }
         return getString("image_hash");
      }
      
      public function get isOnline() : Boolean
      {
         if(name == User.current.character.name)
         {
            return false;
         }
         var _loc1_:int = getInt("online_status");
         if(_loc1_ != 1)
         {
            return false;
         }
         return true;
      }
      
      public function get isMyGuildMember() : Boolean
      {
         if(id == User.current.character.id)
         {
            return false;
         }
         if(!User.current.character.hasGuild)
         {
            return false;
         }
         return User.current.character.guild.getMember(name) !== null;
      }
   }
}
