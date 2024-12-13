/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package FC.Model;

/**
 *
 * @author navod
 */
public class Cast {
    private String actorName;
    private String characterName;

    // Constructor
    public Cast(String actorName, String characterName) {
        this.actorName = actorName;
        this.characterName = characterName;
    }

    // Getters and Setters
    public String getActorName() {
        return actorName;
    }

    public void setActorName(String actorName) {
        this.actorName = actorName;
    }

    public String getCharacterName() {
        return characterName;
    }

    public void setCharacterName(String characterName) {
        this.characterName = characterName;
    }

    // ToString method
    @Override
    public String toString() {
        return "Cast{" +
                "actorName='" + actorName + '\'' +
                ", characterName='" + characterName + '\'' +
                '}';
    }
}
