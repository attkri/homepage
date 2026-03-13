import React, { type FC } from "react";
import type { IconType } from "react-icons";
import {
  FaAsterisk,
  FaExpand,
  FaFacebook,
  FaGithub,
  FaHandHoldingHeart,
  FaLinkedin,
  FaXTwitter,
} from "react-icons/fa6";

const iconMap: Record<string, IconType> = {
  FaAsterisk,
  FaExpand,
  FaFacebook,
  FaGithub,
  FaHandHoldingHeart,
  FaLinkedin,
  FaXTwitter,
};

interface IDynamicIcon extends React.SVGProps<SVGSVGElement> {
  icon: string;
  className?: string;
}

const DynamicIcon: FC<IDynamicIcon> = ({ icon, ...props }) => {
  const Icon = iconMap[icon];

  if (!Icon) {
    return <span className="text-sm">Icon not found</span>;
  }

  return <Icon {...props} />;
};

export default DynamicIcon;
